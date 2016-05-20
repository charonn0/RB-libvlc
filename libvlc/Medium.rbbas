#tag Class
Protected Class Medium
Inherits libvlc.VLCInstance
	#tag Method, Flags = &h0
		Sub AddOption(Options As String, Flags As UInt32 = 0)
		  ' Applies advanced reading/streaming options to a single Medium object
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Medium.AddOption
		  ' https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media.html#ga39511e64baa7c1fdbf89eddc88bf9e15
		  ' https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media.html#ga96d5e0f418eecf74149057796160fd3a
		  ' 
		  If mMedium = Nil Then Return
		  If Flags = 0 Then
		    libvlc_media_add_option(mMedium, Options)
		  Else
		    libvlc_media_add_option_flag(mMedium, Options, Flags)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(FileDescriptor As Integer)
		  If FileDescriptor = 0 Then Raise New NilObjectException
		  Super.Constructor()
		  mMedium = libvlc_media_new_fd(Me.Instance, FileDescriptor)
		  If mMedium = Nil Then Raise New VLCException("Unable to create a media reference for the file descriptor.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(AddRef As libvlc.Medium)
		  ' Duplicates the Medium. The duplicate is independent of the original.
		  
		  Super.Constructor(AddRef)
		  libvlc_media_retain(AddRef.mMedium)
		  Me.Constructor(AddRef.mMedium)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mMedium <> Nil Then libvlc_media_release(mMedium)
		  mMedium = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DurationMS() As Int64
		  If Not Me.IsParsed Then Me.Parse()
		  If mMedium <> Nil Then Return libvlc_media_get_duration(mMedium)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetStats() As libvlc_media_stats_t
		  If mMedium <> Nil Then
		    Dim p As libvlc_media_stats_t
		    If libvlc_media_get_stats(mMedium, p) Then Return p
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mMedium
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
		Function MediaFile() As FolderItem
		  Dim url As String = Me.MediaURL
		  If Left(url, 5) = "file:" Then Return GetFolderItem(url, FolderItem.PathTypeURL)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MediaURL() As String
		  ' Returns the Media Resource Locator ("MRL", AKA "URL") of the media. For media constructed from FolderItems, this is the URLPath.
		  
		  If mMedium <> Nil Then
		    Dim mb As MemoryBlock = libvlc_media_get_mrl(mMedium)
		    If mb <> Nil Then Return mb.CString(0)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherInstance As libvlc.Medium) As Integer
		  Dim i As Integer = Super.Operator_Compare(OtherInstance)
		  If i = 0 Then i = Sign(Integer(mMedium) - Integer(OtherInstance.mMedium))
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromFolderItem As FolderItem)
		  ' Constructs a new Medium from the specified FolderItem. The FolderItem may be a file or a directory/disk drive.
		  
		  Me.Operator_Convert(FromFolderItem.URLPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromPtr As Ptr)
		  ' Constructs an Instance of Medium using FromPtr without incrementing VLC's internal refcount for the Ptr.
		  ' This method assumes that the refcount was incremented when the Ptr was created so we don't need to do it again.
		  ' However, the refcount WILL be decremented by Medium.Destructor; refer to the specific VLC function docs to
		  ' determine whether this is appropriate.
		  
		  Super.Constructor()
		  mMedium = FromPtr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromURL As String)
		  ' Constructs a new Medium from the specified URL. The URL may refer to a local or network location, using any supported protocol.
		  
		  Super.Constructor()
		  mMedium = libvlc_media_new_location(Me.Instance, FromURL)
		  If mMedium = Nil Then Raise New UnsupportedFormatException
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
		Function TrackList() As libvlc.Meta.MediaTrackList
		  ' Returns a TrackList object representing the tracks of the media (audio, video, subtitles, etc.)
		  
		  If mMedium <> Nil Then Return New libvlc.Meta.MediaTrackList(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As libvlc.MediaType
		  ' Returns a member of the libvlc.MediaType enum, representing the type of media being handled (file, disc, stream, etc.)
		  
		  If mMedium <> Nil Then Return libvlc_media_get_type(mMedium)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated = "libvlc.Medium.MediaURL" )  Function URL() As String
		  Return Me.MediaURL
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMedium <> Nil Then Return libvlc_media_get_state(mMedium)
			End Get
		#tag EndGetter
		CurrentState As libvlc.PlayerState
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mMedium As Ptr
	#tag EndProperty


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
