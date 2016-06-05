#tag Class
Private Class EventManager
Implements EventReceiver
	#tag Method, Flags = &h0
		Sub Constructor(EventReceiver As Ptr, EventSource As libvlc.VLCInstance)
		  If Instances = Nil Then
		    Instances = New Dictionary
		  ElseIf Instances.HasKey(EventSource.Instance) Then
		    Raise New VLCException("This event source already has an EventManager.")
		  End If
		  mReceiver = EventReceiver
		  mID = EventSource.Instance
		  Instances.Value(mID) = New WeakRef(Me)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub DefaultHandler(EventStruct As libvlc_event_t, UserData As Integer)
		  #pragma X86CallingConvention CDecl
		  Dim w As WeakRef = Instances.Lookup(UserData, Nil)
		  If w = Nil Or w.Value = Nil Or Not w.Value IsA EventManager Then
		    Break '?
		    Return
		  End If
		  EventManager(w.Value).Dispatch(EventStruct)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If Instances <> Nil And Instances.HasKey(mID) Then
		    Instances.Remove(mID)
		    If Instances.Count = 0 Then Instances = Nil
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Dispatch(EventStruct As libvlc_event_t)
		  RaiseEvent VLCEvent(EventType(EventStruct.Type), EventStruct.Referent, EventStruct.Data)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSubscribed(EventType As libvlc.EventType) As Boolean
		  // Part of the libvlc.EventReceiver interface.
		  Return mSubscriptions.IndexOf(EventType) > -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NextNum() As Integer
		  Static i As Integer
		  i = i + 1
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Subscribe(EventType As libvlc.EventType) As Boolean
		  // Part of the libvlc.EventReceiver interface.
		  If Me.IsSubscribed(EventType) Then Return True
		  
		  Dim err As Integer = libvlc_event_attach(mReceiver, EventType, AddressOf DefaultHandler, mID)
		  If err = 0 Then
		    mSubscriptions.Append(EventType)
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unsubscribe(EventType As libvlc.EventType)
		  // Part of the libvlc.EventReceiver interface.
		  Dim index As Integer = mSubscriptions.IndexOf(EventType)
		  If index > -1 Then
		    libvlc_event_detach(mReceiver, EventType, AddressOf DefaultHandler, mID)
		    mSubscriptions.Remove(index)
		  Else
		    Raise New VLCException("The event has no subscribers in this context.")
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event VLCEvent(EventType As libvlc.EventType, Referent As Ptr, DataStruct As Ptr)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared Instances As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mID As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReceiver As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubscriptions() As libvlc.EventType
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
