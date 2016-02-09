#tag Class
Protected Class VLCMedium
Implements VLCHandle
	#tag Method, Flags = &h0
		Sub Constructor(MediaFile As FolderItem)
		  Me.Constructor(MediaFile.URLPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(AddRef As libvlc.VLCMedium)
		  mInstance = AddRef.Instance
		  libvlc_media_retain(AddRef.mMedium)
		  Me.Constructor(AddRef.mMedium)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(Medium As Ptr)
		  mMedium = Medium
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(URL As String)
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
		  // Part of the libvlc.VLCHandle interface.
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
		  Return libvlc_media_is_parsed(mMedium)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromPtr As Ptr)
		  Me.Constructor(FromPtr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse()
		  If mMedium <> Nil Then libvlc_media_parse(mMedium)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrackList() As libvlc.TrackList
		  Return New libvlc.TrackList(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As libvlc.MediaType
		  Return libvlc_media_get_type(mMedium)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URL() As String
		  Dim mb As MemoryBlock = libvlc_media_get_mrl(mMedium)
		  If mb <> Nil Then Return mb.CString(0)
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
