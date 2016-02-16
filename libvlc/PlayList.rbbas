#tag Class
Protected Class PlayList
Inherits libvlc.VLCInstance
	#tag Method, Flags = &h0
		Sub Append(Medium As libvlc.VLCMedium)
		  Me.Lock
		  Try
		    If libvlc_media_list_add_media(mList, Medium.Handle) <> 0 Then Raise New VLCException("Unable to add media to the media list.")
		  Finally
		    Me.Unlock
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Super.Constructor()
		  mList = libvlc_media_list_new(Me.Instance)
		  If mList = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC media list.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  If mList = Nil Then Return -1
		  Dim ret As Integer
		  Me.Lock
		  Try
		    ret = libvlc_media_list_count(mList)
		  Finally
		    Me.Unlock
		  End Try
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentItem() As libvlc.VLCMedium
		  If mList <> Nil Then
		    Dim p As Ptr = libvlc_media_list_media(mList)
		    If p <> Nil Then Return p
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CurrentItem(Assigns NewMedium As libvlc.VLCMedium)
		  Dim i As Integer = Me.IndexOf(NewMedium)
		  If i > -1 Then
		    libvlc_media_list_set_media(mList, Me.Item(i).Handle)
		  Else
		    Raise New VLCException("That medium is not in the list.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mList <> Nil Then libvlc_media_list_release(mList)
		  mList = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Medium As libvlc.VLCMedium) As Integer
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
		Sub Insert(Index As Integer, Medium As libvlc.VLCMedium)
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
		Function Item(Index As Integer) As libvlc.VLCMedium
		  If mList = Nil Then Raise New OutOfBoundsException
		  Dim ret As VLCMedium
		  Me.Lock
		  Try
		    Dim p As Ptr = libvlc_media_list_item_at_index(mList, Index)
		    If p <> Nil Then ret = p
		  Finally
		    Me.Unlock
		  End Try
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Lock()
		  If mList <> Nil Then libvlc_media_list_lock(mList) Else Raise New IllegalLockingException
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherInstance As libvlc.PlayList) As Integer
		  Dim i As Integer = Super.Operator_Compare(OtherInstance)
		  If i = 0 Then i = Sign(Integer(mList) - Integer(OtherInstance.mList))
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromPtr As Ptr)
		  Super.Constructor()
		  mList = FromPtr
		End Sub
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
		  If mList <> Nil Then libvlc_media_list_unlock(mList) Else Raise New IllegalLockingException
		End Sub
	#tag EndMethod


	#tag Note, Name = About this class
		This class represents an array of VLCMedium objects (i.e., a list of media to be played in a particular order.)
	#tag EndNote


	#tag Property, Flags = &h1
		Protected mList As Ptr
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
	#tag EndViewBehavior
End Class
#tag EndClass
