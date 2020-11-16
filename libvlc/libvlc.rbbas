#tag Module
Protected Module libvlc
	#tag Method, Flags = &h21
		Private Function AbsolutePath_(Extends f As FolderItem) As String
		  #If RBVersion > 2019 Then
		    Return f.NativePath
		  #Else
		    Return f.AbsolutePath
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CompilerVersionString() As String
		  Dim mb As MemoryBlock = libvlc_get_compiler()
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatTime(Milliseconds As UInt64, FractionalSeconds As Boolean = False) As String
		  ' Formats the period of time denoted by Milliseconds as HH:MM:SS. If FractionalSeconds is true then fractions of a second are included.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.FormatTime
		  
		  Dim hours As UInt32 = (Milliseconds / (1000 * 60 * 60))
		  Dim minutes As UInt32 = (Milliseconds / (1000 * 60)) Mod 60
		  Dim seconds As UInt32 = (Milliseconds / 1000) Mod 60
		  Dim frac As UInt32  = Milliseconds Mod 1000
		  Dim out As String
		  If hours > 0 Then
		    out = Str(hours) + ":" + Format(minutes, "00") + ":"
		  Else
		    out = out + Format(minutes, "#0") + ":"
		  End If
		  If FractionalSeconds Then
		    out = out + Format(seconds + (frac / 1000), "00.00")
		  Else
		    out = out + Format(seconds, "00")
		  End If
		  Return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  Static available As Boolean
		  If Not available Then available = System.IsFunctionAvailable("libvlc_new", VLCLib)
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
		Private Soft Declare Function libvlc_add_intf Lib VLCLib (Instance As Ptr, Name As CString) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_get_amp_at_index Lib VLCLib (Equalizer As Ptr, Frequency As UInt32) As Single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_get_band_count Lib VLCLib () As UInt32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_get_band_frequency Lib VLCLib (BandNumber As UInt32) As Single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_get_preamp Lib VLCLib (Equalizer As Ptr) As Single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_get_preset_count Lib VLCLib () As UInt32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_get_preset_name Lib VLCLib (Index As UInt32) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_new Lib VLCLib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_new_from_preset Lib VLCLib (Index As UInt32) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_audio_equalizer_release Lib VLCLib (Equalizer As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_set_amp_at_index Lib VLCLib (Equalizer As Ptr, Amplification As Single, Frequency As UInt32) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_equalizer_set_preamp Lib VLCLib (Equalizer As Ptr, PreAmplification As Single) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_filter_list_get Lib VLCLib (Instance As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_get_mute Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_get_track Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_get_track_count Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_get_track_description Lib VLCLib (Player As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_get_volume Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_output_list_get Lib VLCLib (Instance As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_audio_output_list_release Lib VLCLib (ListPtr As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_output_set Lib VLCLib (Player As Ptr, OutputName As CString) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_audio_set_mute Lib VLCLib (Player As Ptr, DoMute As Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_set_track Lib VLCLib (Player As Ptr, TrackID As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_audio_set_volume Lib VLCLib (Player As Ptr, Percent As Integer) As Integer
	#tag EndExternalMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub libvlc_callback_t(EventStruct As libvlc_event_t, UserData As Ptr)
	#tag EndDelegateDeclaration

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_clearerr Lib VLCLib ()
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_clock Lib VLCLib () As Int64
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_delay Lib VLCLib (TimeUntil As Int64) As Int64
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_errmsg Lib VLCLib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_free Lib VLCLib (Reference As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_get_compiler Lib VLCLib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_get_fullscreen Lib VLCLib (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_get_version Lib VLCLib () As Ptr
	#tag EndExternalMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub libvlc_log_cb(UserData As Ptr, Level As Integer, Context As Ptr, Format As CString, Args As Ptr)
	#tag EndDelegateDeclaration

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_log_set Lib VLCLib (Instance As Ptr, Callback As Ptr, UserData As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_log_unset Lib VLCLib (Instance As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_add_option Lib VLCLib (Medium As Ptr, Options As CString)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_add_option_flag Lib VLCLib (Medium As Ptr, Options As CString, Flags As UInt32)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_event_manager Lib VLCLib (Medium As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_get_duration Lib VLCLib (Medium As Ptr) As Int64
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_get_meta Lib VLCLib (Medium As Ptr, DataType As libvlc . MetaDataType) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_get_mrl Lib VLCLib (Medium As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_get_state Lib VLCLib (Medium As Ptr) As libvlc.PlayerState
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_get_stats Lib VLCLib (Medium As Ptr, ByRef StatsBuffer As libvlc_media_stats_t) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_get_type Lib VLCLib (Medium As Ptr) As libvlc.MediaType
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_is_parsed Lib VLCLib (Medium As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_add_media Lib VLCLib (MediaList As Ptr, Medium As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_count Lib VLCLib (MediaList As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_event_manager Lib VLCLib (MediaList As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_index_of_item Lib VLCLib (MediaList As Ptr, Medium As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_insert_media Lib VLCLib (MediaList As Ptr, Medium As Ptr, Index As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_is_readonly Lib VLCLib (MediaList As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_item_at_index Lib VLCLib (MediaList As Ptr, Index As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_lock Lib VLCLib (MediaList As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_media Lib VLCLib (MediaList As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_new Lib VLCLib (Instance As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_player_get_media_player Lib VLCLib (ListPlayer As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_player_get_state Lib VLCLib (ListPlayer As Ptr) As libvlc.PlayerState
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_player_is_playing Lib VLCLib (ListPlayer As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_player_new Lib VLCLib (Instance As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_player_next Lib VLCLib (ListPlayer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_player_pause Lib VLCLib (ListPlayer As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_player_play Lib VLCLib (ListPlayer As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_player_play_item Lib VLCLib (ListPlayer As Ptr, Medium As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_player_play_item_at_index Lib VLCLib (ListPlayer As Ptr, Index As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_player_previous Lib VLCLib (ListPlayer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_player_release Lib VLCLib (ListPlayer As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_player_set_media_list Lib VLCLib (ListPlayer As Ptr, MediaList As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_player_set_media_player Lib VLCLib (ListPlayer As Ptr, NewVLCPlayer As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_player_set_playback_mode Lib VLCLib (ListPlayer As Ptr, PlayMode As libvlc . PlaybackMode)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_player_stop Lib VLCLib (ListPlayer As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_release Lib VLCLib (MediaList As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_list_remove_index Lib VLCLib (MediaList As Ptr, Index As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_set_media Lib VLCLib (MediaList As Ptr, Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_list_unlock Lib VLCLib (MediaList As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_new_callbacks Lib VLCLib (Instance As Ptr, OpenCB As Ptr, ReadCB As Ptr, SeekCB As Ptr, CloseCB As Ptr, Opaque As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_new_fd Lib VLCLib (Instance As Ptr, Descriptor As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_new_location Lib VLCLib (Instance As Ptr, MediaURL As CString) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_parse Lib VLCLib (Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_can_pause Lib VLCLib (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_event_manager Lib VLCLib (Player As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_hwnd Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_length Lib VLCLib (Player As Ptr) As Int64
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_media Lib VLCLib (Player As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_nsobject Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_position Lib VLCLib (Player As Ptr) As Single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_rate Lib VLCLib (Player As Ptr) As Single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_state Lib VLCLib (Player As Ptr) As libvlc.PlayerState
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_time Lib VLCLib (Player As Ptr) As Int64
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_get_xwindow Lib VLCLib (Player As Ptr) As UInt32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_is_playing Lib VLCLib (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_is_seekable Lib VLCLib (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_navigate Lib VLCLib (Player As Ptr, Mode As libvlc . NavigationMode)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_new Lib VLCLib (Instance As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_new_from_media Lib VLCLib (Media As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_next_frame Lib VLCLib (Player As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_play Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_release Lib VLCLib (Player As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_retain Lib VLCLib (Player As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_set_equalizer Lib VLCLib (Player As Ptr, Equalizer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_hwnd Lib VLCLib (Player As Ptr, HWND As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_media Lib VLCLib (Player As Ptr, Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_nsobject Lib VLCLib (Player As Ptr, NSObject As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_pause Lib VLCLib (Player As Ptr, DoPause As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_position Lib VLCLib (Player As Ptr, Percent As Single)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_rate Lib VLCLib (Player As Ptr, RewRate As Single)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_time Lib VLCLib (Player As Ptr, TimeMS As UInt64)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_xwindow Lib VLCLib (Player As Ptr, XID As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_stop Lib VLCLib (Player As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_player_will_play Lib VLCLib (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_release Lib VLCLib (Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_retain Lib VLCLib (Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_save_meta Lib VLCLib (Medium As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_set_meta Lib VLCLib (Medium As Ptr, DataType As libvlc . MetaDataType, NewData As CString)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_media_tracks_get Lib VLCLib (Medium As Ptr, ByRef TrackBuffer As Ptr) As UInt32
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_tracks_release Lib VLCLib (TrackList As Ptr, Count As UInt32)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_module_description_list_release Lib VLCLib (ListPtr As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_new Lib VLCLib (argc As Integer, argv As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_release Lib VLCLib (Instance As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_retain Lib VLCLib (Instance As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_set_fullscreen Lib VLCLib (Player As Ptr, IsFullscreen As Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_set_user_agent Lib VLCLib (Instance As Ptr, Name As CString, UserAgent As CString)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_toggle_fullscreen Lib VLCLib (Player As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_toggle_teletext Lib VLCLib (Player As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_track_description_list_release Lib VLCLib (ListPtr As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_filter_list_get Lib VLCLib (Instance As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_adjust_int Lib VLCLib (Player As Ptr, Option As UInt32) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_aspect_ratio Lib VLCLib (Player As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_cursor Lib VLCLib (Player As Ptr, VideoIndex As UInt32, ByRef X As Integer, ByRef Y As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_scale Lib VLCLib (Player As Ptr) As Single
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_size Lib VLCLib (Player As Ptr, VideoIndex As UInt32, ByRef Width As Integer, ByRef Height As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_spu Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_spu_count Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_spu_description Lib VLCLib (Player As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_track Lib VLCLib (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_get_track_description Lib VLCLib (Player As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_video_set_adjust_int Lib VLCLib (Player As Ptr, Option As UInt32, Value As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_video_set_aspect_ratio Lib VLCLib (Player As Ptr, AspectRatio As CString)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_video_set_deinterlace Lib VLCLib (Player As Ptr, Mode As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_video_set_key_input Lib VLCLib (Player As Ptr, On As Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_video_set_mouse_input Lib VLCLib (Player As Ptr, On As Boolean)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_video_set_scale Lib VLCLib (Player As Ptr, ScaleFactor As Single)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_set_spu Lib VLCLib (Player As Ptr, Index As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_set_subtitle_file Lib VLCLib (Player As Ptr, SubtitleFile As CString) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_set_track Lib VLCLib (Player As Ptr, TrackID As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function libvlc_video_take_snapshot Lib VLCLib (Player As Ptr, VideoIndex As Integer, FilePath As CString, Width As Integer, Height As Integer) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function PlayerStateName(State As libvlc.PlayerState) As String
		  Select Case State
		  Case libvlc.PlayerState.BUFFERING
		    Return "buffering"
		  Case libvlc.PlayerState.ENDED
		    Return "finished"
		  Case libvlc.PlayerState.ERROR
		    Return "error"
		  Case libvlc.PlayerState.IDLE
		    Return "idle"
		  Case libvlc.PlayerState.OPENING
		    Return "opening"
		  Case libvlc.PlayerState.PAUSED
		    Return "paused"
		  Case libvlc.PlayerState.PLAYING
		    Return "playing"
		  Case libvlc.PlayerState.STOPPING
		    Return "stopping"
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SplitQuoted(Data As String) As String()
		  Dim output() As String
		  Dim input As New BinaryStream(Data)
		  Dim tmp As String
		  Dim quote As Boolean
		  Do Until input.EOF
		    Dim char As String = input.Read(1)
		    Select Case char
		    Case " "
		      If quote Then
		        tmp = tmp + char
		      Else
		        output.Append(tmp)
		        tmp = ""
		      End If
		      
		    Case """"
		      quote = Not quote
		      
		    Else
		      tmp = tmp + char
		    End Select
		  Loop
		  If tmp.Trim <> "" Then output.Append(tmp)
		  input.Close
		  Return output
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VersionString() As String
		  Dim mb As MemoryBlock = libvlc_get_version()
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VLCTimeNow() As Int64
		  ' Return the current time as defined by LibVLC. The unit is the microsecond. Time increases monotonically 
		  ' (regardless of time zone changes and RTC adjustements). The origin is arbitrary but consistent across the 
		  ' whole system (e.g. the system uptime).
		  
		  Return libvlc_clock()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VLCTimeUntil(PointInTime As Int64) As Int64
		  ' Returns the number of Microseconds until (or since) the VLCTimeNow matches the specified PointInTime. Points in the past will be
		  ' negative.
		  
		  Return libvlc_delay(PointInTime)
		End Function
	#tag EndMethod


	#tag Constant, Name = DEFAULT_ARGS, Type = String, Dynamic = False, Default = \"", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = VLCLib, Type = String, Dynamic = False, Default = \"libvlc.so.5", Scope = Private
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"libvlc.dll"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"@executable_path/\xE2\x80\xA6/\xE2\x80\xA6/\xE2\x80\xA6/lib/libvlc.5.dylib"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libvlc.so.5"
	#tag EndConstant


	#tag Structure, Name = libvlc_audio_output_t, Flags = &h21
		psz_name As Ptr
		psz_description As Ptr
	#tag EndStructure

	#tag Structure, Name = libvlc_event_t, Flags = &h21
		Type As Integer
		  Referent As Ptr
		Data As Ptr
	#tag EndStructure

	#tag Structure, Name = libvlc_media_stats_t, Flags = &h21
		ReadBytes As Integer
		  InputBitrate As Single
		  DemuxReadBytes As Integer
		  BemuxBitrate As Single
		  DemuxCorrupted As Integer
		  DemuxDiscontinuity As Integer
		  DecodedVideo As Integer
		  DecodedAudio As Integer
		  DisplayedPictures As Integer
		  LostPictures As Integer
		  PlayedABuffers As Integer
		  LostABuffers As Integer
		  SentPackets As Integer
		  SentBytes As Integer
		SendBitrate As Single
	#tag EndStructure

	#tag Structure, Name = libvlc_media_track_t, Flags = &h21
		Codec As UInt32
		  OriginalFourCC As UInt32
		  ID As Integer
		  Type As Integer
		  Profile As Integer
		  Level As Integer
		  TrackPtr As Ptr
		  BitRate As UInt32
		  Language As Ptr
		Description As Ptr
	#tag EndStructure

	#tag Structure, Name = libvlc_module_description_t, Flags = &h21
		psz_name As Ptr
		  psz_shortname As Ptr
		  psz_longname As Ptr
		psz_help As Ptr
	#tag EndStructure

	#tag Structure, Name = libvlc_track_description_t, Flags = &h21
		ID As Integer
		Name As Ptr
	#tag EndStructure


	#tag Enum, Name = AdjustOption, Type = Integer, Flags = &h1
		Enable
		  Contrast
		  Brightness
		  Hue
		  Saturation
		Gamma
	#tag EndEnum

	#tag Enum, Name = LogoOption, Type = Integer, Flags = &h1
		Enable
		  File
		  X
		  Y
		  Delay
		  Repeat
		  Opacity
		Position
	#tag EndEnum

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

	#tag Enum, Name = NavigationMode, Type = Integer, Flags = &h1
		Activate
		  Up
		  Down
		  Left
		  Right
		Popup
	#tag EndEnum

	#tag Enum, Name = PlaybackMode, Type = Integer, Flags = &h1
		Default
		  Looping
		Repeat
	#tag EndEnum

	#tag Enum, Name = PlayerState, Type = Integer, Flags = &h1
		IDLE=0
		  OPENING=1
		  BUFFERING=2
		  PLAYING=3
		  PAUSED=4
		  STOPPING=5
		  ENDED=6
		ERROR=7
	#tag EndEnum

	#tag Enum, Name = TrackType, Type = Integer, Flags = &h1
		Unknown=-1
		  Audio=0
		  Video=1
		Text=2
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
