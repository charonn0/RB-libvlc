#tag Class
Protected Class PlayList
Implements VLCHandle
	#tag Method, Flags = &h0
		Sub Append(Medium As FolderItem)
		  Me.Append(Medium.URLPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Append(Medium As libvlc.VLCMedium)
		  Me.Lock
		  Try
		    If libvlc_media_list_add_media(mList, Medium.Handle) <> 0 Then Raise New VLCException("Unable to add media to the media list.")
		  Finally
		    Me.Unlock
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Append(Medium As String)
		  Dim m As New VLCMedium(Medium)
		  Me.Append(m)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mInstance = VLCInstance.GetInstance
		  mList = libvlc_media_list_new(mInstance.Handle)
		  If mList = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC media list.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
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

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mList <> Nil Then libvlc_media_list_release(mList)
		  mList = Nil
		  mInstance = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  // Part of the libvlc.VLCHandle interface.
		  Return mList
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Medium As FolderItem) As Integer
		  Dim m As New VLCMedium(Medium)
		  Return Me.IndexOf(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IndexOf(Medium As libvlc.VLCMedium) As Integer
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
		Function IndexOf(Medium As String) As Integer
		  Dim m As New VLCMedium(Medium)
		  Return Me.IndexOf(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, Medium As FolderItem)
		  Dim m As New VLCMedium(Medium)
		  Me.Insert(Index, m)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Insert(Index As Integer, Medium As libvlc.VLCMedium)
		  Me.Lock
		  Try
		    If libvlc_media_list_insert_media(mList, Medium.Handle, Index) <> 0 Then Raise New VLCException("Unable to insert media into the media list.")
		  Finally
		    Me.Unlock
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, Medium As String)
		  Dim m As New VLCMedium(Medium)
		  Me.Insert(Index, m)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Index As Integer) As libvlc.VLCMedium
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

	#tag Method, Flags = &h0
		Function ItemPath(Index As Integer) As FolderItem
		  Dim m As VLCMedium = Me.Item(Index)
		  If m = Nil Then Return Nil
		  Dim url As String = m.URL
		  If Left(url, 5) = "file:" Then Return GetFolderItem(url, FolderItem.PathTypeURL)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemURL(Index As Integer) As String
		  Dim m As VLCMedium = Me.Item(Index)
		  Return m.URL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Lock()
		  libvlc_media_list_lock(mList)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Media() As libvlc.VLCMedium
		  Dim p As Ptr = libvlc_media_list_media(mList)
		  If p <> Nil Then Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Media(Assigns NewMedium As libvlc.VLCMedium)
		  libvlc_media_list_set_media(mList, NewMedium.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromPtr As Ptr)
		  mInstance = VLCInstance.GetInstance()
		  mList = FromPtr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
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
		  libvlc_media_list_unlock(mList)
		End Sub
	#tag EndMethod


	#tag Note, Name = About this class
		This class represents an array of VLCMedium objects (i.e., a list of media to be played in a particular order.)
	#tag EndNote


	#tag Property, Flags = &h1
		Protected mInstance As VLCInstance
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mList As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return libvlc_media_list_is_readonly(mList)
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
