#tag Module
Protected Module libvlc
	#tag Method, Flags = &h1
		Protected Function CompilerVersionString() As String
		  Dim mb As MemoryBlock = libvlc_get_compiler()
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  Static available As Boolean
		  If Not available Then available = System.IsFunctionAvailable("libvlc_new", "libvlc")
		  Return available
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LastErrorMessage(Clear As Boolean = False) As String
		  Dim err As String
		  Dim mb As MemoryBlock = libvlc_errmsg()
		  If mb <> Nil Then err = mb.CString(0)
		  If Clear Then libvlc_clearerr()
		  Return err
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_add_intf Lib "libvlc" (Instance As Ptr, Name As CString) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_filter_list_get Lib "libvlc" (Instance As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_clearerr Lib "libvlc" ()
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_errmsg Lib "libvlc" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_get_compiler Lib "libvlc" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_get_version Lib "libvlc" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_get_meta Lib "libvlc" (Medium As Ptr, DataType As libvlc . MetaDataType) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_get_mrl Lib "libvlc" (Medium As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_get_type Lib "libvlc" (Medium As Ptr) As libvlc.MediaType
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_is_parsed Lib "libvlc" (Medium As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_new_location Lib "libvlc" (Instance As Ptr, MediaURL As CString) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_parse Lib "libvlc" (Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_can_pause Lib "libvlc" (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_length Lib "libvlc" (Player As Ptr) As Int64
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_media Lib "libvlc" (Player As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_position Lib "libvlc" (Player As Ptr) As Single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_state Lib "libvlc" (Player As Ptr) As libvlc.VLCPlayer.PlayerStates
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_time Lib "libvlc" (Player As Ptr) As Int64
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_is_playing Lib "libvlc" (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_is_seekable Lib "libvlc" (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_new Lib "libvlc" (Instance As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_new_from_media Lib "libvlc" (Media As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_play Lib "libvlc" (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_release Lib "libvlc" (Player As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_hwnd Lib "libvlc" (Player As Ptr, HWND As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_media Lib "libvlc" (Player As Ptr, Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_nsobject Lib "libvlc" (Player As Ptr, NSObject As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_pause Lib "libvlc" (Player As Ptr, DoPause As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_position Lib "libvlc" (Player As Ptr, Percent As Single)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_xwindow Lib "libvlc" (Player As Ptr, XID As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_stop Lib "libvlc" (Player As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_will_play Lib "libvlc" (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_release Lib "libvlc" (Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_retain Lib "libvlc" (Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_save_meta Lib "libvlc" (Medium As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_set_meta Lib "libvlc" (Medium As Ptr, DataType As libvlc . MetaDataType, NewData As CString)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_module_description_list_release Lib "libvlc" (ListPtr As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_new Lib "libvlc" (argc As Integer, argv As CString) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_release Lib "libvlc" (Instance As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_retain Lib "libvlc" (Instance As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_set_user_agent Lib "libvlc" (Instance As Ptr, Name As CString, UserAgent As CString)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_filter_list_get Lib "libvlc" (Instance As Ptr) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function VersionString() As String
		  Dim mb As MemoryBlock = libvlc_get_version()
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod


	#tag Structure, Name = libvlc_module_description_t, Flags = &h21
		psz_name As Ptr
		  psz_shortname As Ptr
		  psz_longname As Ptr
		psz_help As Ptr
	#tag EndStructure


	#tag Enum, Name = MediaType, Type = Integer, Flags = &h1
		Unknown
		  File
		  Directory
		  Disc
		  Stream
		Playlist
	#tag EndEnum

	#tag Enum, Name = MetaDataType, Type = Integer, Flags = &h1
		Title
		  Artist
		  Genre
		  Copyright
		  Album
		  TrackNumber
		  Description
		  Rating
		  Date
		  Setting
		  URL
		  Language
		  NowPlaying
		  Publisher
		  EncodedBy
		  ArtworkURL
		  TrackID
		  TrackTotal
		  Director
		  Season
		  Episode
		  ShowName
		  Actors
		  AlbumArtist
		  DiscNumber
		DiscTotal
	#tag EndEnum


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
End Module
#tag EndModule
