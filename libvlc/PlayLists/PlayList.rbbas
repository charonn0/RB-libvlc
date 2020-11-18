#tag Class
Protected Class PlayList
Inherits libvlc.VLCInstance
	#tag Method, Flags = &h0
		Sub Append(Medium As libvlc.Medium)
		  ' Append a medium to the playlist.
		  
		  Me.Lock()
		  Try
		    If libvlc_media_list_add_media(mList, Medium.Handle) <> 0 Then Raise New VLCException("Unable to add media to the media list.")
		    mMediaList.Append(Medium)
		  Finally
		    Me.Unlock()
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' Creates a new, empty playlist.
		  
		  Super.Constructor(DEFAULT_ARGS)
		  mList = libvlc_media_list_new(Me.Instance)
		  If mList = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC media list.")
		  mLock = New Semaphore
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mList <> Nil Then libvlc_media_list_release(mList)
		  mList = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Medium As libvlc.Medium) As Integer
		  If mList = Nil Then Return -1
		  Dim ret As Integer
		  Me.Lock
		  Try
		    ret = libvlc_media_list_index_of_item(mList, Medium.Handle)
		  Finally
		    Me.Unlock
		  End Try
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, Medium As libvlc.Medium)
		  If mList = Nil Then Raise New OutOfBoundsException
		  Me.Lock
		  Try
		    If libvlc_media_list_insert_media(mList, Medium.Handle, Index) <> 0 Then Raise New VLCException("Unable to insert media into the media list.")
		  Finally
		    Me.Unlock
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Index As Integer) As libvlc.Medium
		  If mList = Nil Then Raise New OutOfBoundsException
		  Dim ret As Medium
		  Me.Lock
		  Try
		    Dim p As Ptr = libvlc_media_list_item_at_index(mList, Index)
		    If p <> Nil Then ret = New MediumPtr(p)
		  Finally
		    Me.Unlock
		  End Try
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Lock()
		  mLock.Signal()
		  If mList <> Nil Then libvlc_media_list_lock(mList)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherInstance As libvlc.PlayLists.PlayList) As Integer
		  Dim i As Integer = Super.Operator_Compare(OtherInstance)
		  If i = 0 Then i = Sign(Integer(mList) - Integer(OtherInstance.mList))
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  If mList = Nil Then Raise New OutOfBoundsException
		  Me.Lock
		  Try
		    If libvlc_media_list_remove_index(mList, Index) <> 0 Then Raise New VLCException("The media list does not contain an entry at that index.")
		  Finally
		    Me.Unlock
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Unlock()
		  Try
		    If mList <> Nil Then libvlc_media_list_unlock(mList)
		  Finally
		    mLock.Release()
		  End Try
		End Sub
	#tag EndMethod


	#tag Note, Name = About this class
		This class represents an array of Medium objects (i.e., a list of media to be played in a particular order.)
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mList = Nil Then Return -1
			  Dim ret As Integer
			  Me.Lock()
			  Try
			    ret = libvlc_media_list_count(mList)
			  Finally
			    Me.Unlock()
			  End Try
			  
			  Return ret
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mList = Nil Then Return -1
			  Dim item As libvlc.Medium = CurrentItem()
			  If item <> Nil Then Return IndexOf(item) Else Return -1
			End Get
		#tag EndGetter
		CurrentIndex As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mList <> Nil Then
			    ' Dim p As Ptr = libvlc_media_list_media(mList)
			    ' If p <> Nil Then Return New MediumPtr(p)
			    For i As Integer = 0 To UBound(mMediaList)
			      If mMediaList(i).CurrentState = libvlc.PlayerState.PLAYING Then Return mMediaList(i)
			    Next
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim i As Integer = Me.IndexOf(value)
			  If i > -1 Then
			    libvlc_media_list_set_media(mList, Me.Item(i).Handle)
			  Else
			    Raise New VLCException("That medium is not in the list.")
			  End If
			End Set
		#tag EndSetter
		CurrentItem As libvlc.Medium
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mList
			End Get
		#tag EndGetter
		Handle As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mList As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLock As Semaphore
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMediaList() As libvlc.Medium
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mList <> Nil Then Return libvlc_media_list_is_readonly(mList)
			End Get
		#tag EndGetter
		ReadOnly As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AppName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
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
			Name="Logging"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Group="Behavior"
			Type="Boolean"
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
		#tag ViewProperty
			Name="UserAgent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
