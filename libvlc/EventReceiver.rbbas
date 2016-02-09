#tag Interface
Protected Interface EventReceiver
	#tag Method, Flags = &h0
		Function IsSubscribed(EventType As libvlc.EventType) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Subscribe(EventType As libvlc.EventType) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unsubscribe(EventType As libvlc.EventType)
		  
		End Sub
	#tag EndMethod


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
End Interface
#tag EndInterface
