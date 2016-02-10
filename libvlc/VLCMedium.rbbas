#tag Class
Protected Class VLCMedium
	#tag Method, Flags = &h0
		Sub Constructor(MediaFile As FolderItem)
		  ' Constructs a new VLCMedium from the specified FolderItem. The FolderItem may be a file or a directory/disk drive.
		  
		  Me.Constructor(MediaFile.URLPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(AddRef As libvlc.VLCMedium)
		  ' Duplicates the VLCMedium. The duplicate is independent of the original.
		  
		  mInstance = AddRef.Instance
		  libvlc_media_retain(AddRef.mMedium)
		  Me.Constructor(AddRef.mMedium)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(Medium As Ptr)
		  If Medium = Nil Then Raise New NilObjectException
		  mMedium = Medium
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(URL As String)
		  ' Constructs a new VLCMedium from the specified URL. The URL may refer to a local or network location, using any supported protocol.
		  
		  mInstance = VLCInstance.GetInstance
		  Dim p As Ptr = libvlc_media_new_location(mInstance.Handle, URL)
		  Me.Constructor(p)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mMedium <> Nil Then libvlc_media_release(mMedium)
		  mMedium = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mMedium
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Instance() As VLCInstance
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsParsed() As Boolean
		  ' Returns True if the media's meta data has been parsed. Parsing is done when media are played;
		  ' call the Parse() method to read metadata without playing.
		  
		  If mMedium <> Nil Then Return libvlc_media_is_parsed(mMedium)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromPtr As Ptr)
		  ' Constructs an Instance of VLCMedium using FromPtr without incrementing VLC's internal refcount for the Ptr.
		  ' This method assumes that the refcount was incremented when the Ptr was created so we don't need to do it again.
		  ' However, the refcount WILL be decremented by VLCMedium.Destructor; refer to the specific VLC function docs to 
		  ' determine whether this is appropriate.
		  
		  Me.Constructor(FromPtr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse()
		  ' Parses the media's meta data without playing it. Parsing is done automatically when media are played; call the IsParsed() method to 
		  ' determine whether the metadata has already been parsed. Refer to the MetaData class, and the VLCPlayer.MetaData method.
		  
		  If mMedium <> Nil Then libvlc_media_parse(mMedium)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrackList() As libvlc.TrackList
		  ' Returns a TrackList object representing the tracks of the media (audio, video, subtitles, etc.)
		  
		  If mMedium <> Nil Then Return New libvlc.TrackList(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As libvlc.MediaType
		  ' Returns a member of the libvlc.MediaType enum, representing the type of media being handled (file, disc, stream, etc.)
		  
		  If mMedium <> Nil Then Return libvlc_media_get_type(mMedium)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URL() As String
		  ' Returns the Media Resource Locator ("MRL", AKA "URL") of the media. For media constructed from FolderItems, this is the URLPath.
		  
		  If mMedium <> Nil Then
		    Dim mb As MemoryBlock = libvlc_media_get_mrl(mMedium)
		    If mb <> Nil Then Return mb.CString(0)
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mInstance As VLCInstance
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mMedium As Ptr
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
