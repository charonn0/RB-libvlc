#tag Class
Class VLCPlayer
Inherits libvlc.VLCInstance
	#tag Method, Flags = &h0
		Function AddInterface(InterfaceName As String) As Boolean
		  Return libvlc_add_intf(Me.Instance, InterfaceName) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function AudioFilters() As libvlc.Meta.ModuleList
		  Dim i As New VLCInstance
		  Return New libvlc.Meta.ModuleList(libvlc_audio_filter_list_get(i.Instance))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function AudioOutputs() As libvlc.Meta.AudioOutputList
		  Dim i As New VLCInstance
		  Dim p As Ptr = libvlc_audio_output_list_get(i.Instance)
		  If p <> Nil Then Return New libvlc.Meta.AudioOutputList(p)
		  Raise New VLCException("Unable to get the list of audio output modules.")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AudioTrack() As Integer
		  ' Returns the I_ID of the current track.
		  
		  If mPlayer <> Nil Then Return libvlc_audio_get_track(mPlayer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AudioTrack(Assigns NewTrack As Integer)
		  ' Sets the audio track to the I_ID specified by NewTrack. Call AudioTrackID to get the I_ID.
		  
		  If mPlayer = Nil Then Raise New NilObjectException
		  If libvlc_audio_set_track(mPlayer, NewTrack) <> 0 Then Raise New VLCException("Unable to set the audio track to that index.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AudioTrackCount() As Integer
		  Dim lst As libvlc.Meta.TrackList = Me.AudioTracks
		  If lst <> Nil Then Return lst.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AudioTrackDescription(TrackNumber As Integer) As String
		  Dim lst As libvlc.Meta.TrackList = Me.AudioTracks
		  If lst <> Nil Then Return lst.Name(TrackNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AudioTrackID(TrackNumber As Integer) As Integer
		  ' Returns the I_ID member of the Audio Track at TrackNumber
		  
		  Dim lst As libvlc.Meta.TrackList = Me.AudioTracks
		  If lst <> Nil Then Return lst.ID(TrackNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AudioTrackIndex(TrackID As Integer) As Integer
		  ' Returns the index of the Audio Track corresponding to TrackID, or -1
		  
		  Dim lst As libvlc.Meta.TrackList = Me.AudioTracks
		  If lst <> Nil Then 
		    Dim c As Integer = lst.Count
		    For i As Integer = 0 To c - 1
		      If lst.ID(i) = TrackID Then Return i
		    Next
		  End If
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AudioTracks() As libvlc.Meta.TrackList
		  If mPlayer = Nil Then Return Nil
		  Dim p As Ptr = libvlc_audio_get_track_description(mPlayer)
		  If p <> Nil Then Return New libvlc.Meta.TrackList(p)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' Constructs a new player instance
		  
		  Super.Constructor()
		  mPlayer = libvlc_media_player_new(Me.Instance)
		  If mPlayer = Nil Then Raise New libvlc.VLCException("Unable to construct a player instance.")
		  
		  mStateChangeTimer = New Timer
		  mStateChangeTimer.Period = 150
		  AddHandler mStateChangeTimer.Action, WeakAddressOf StateChangeTimerHandler
		  mStateChangeTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Options As libvlc.InstanceOptions)
		  Dim cmdline As String = Options.ToCommandLine
		  Super.Constructor(1, cmdline)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Medium As libvlc.Medium)
		  ' Constructs a new player instance from the passed media reference
		  
		  Super.Constructor(Medium)
		  mPlayer = libvlc_media_player_new_from_media(Medium.Handle)
		  If mPlayer = Nil Then Raise New libvlc.VLCException("Unable to construct a player instance.")
		  
		  mStateChangeTimer = New Timer
		  mStateChangeTimer.Period = 150
		  AddHandler mStateChangeTimer.Action, WeakAddressOf StateChangeTimerHandler
		  mStateChangeTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  ' Takes ownership of the passed player ref
		  
		  If FromPtr = Nil Then Raise New NilObjectException
		  Super.Constructor()
		  If AddRef Then libvlc_media_player_retain(FromPtr)
		  mPlayer = FromPtr
		  
		  mStateChangeTimer = New Timer
		  mStateChangeTimer.Period = 150
		  AddHandler mStateChangeTimer.Action, WeakAddressOf StateChangeTimerHandler
		  mStateChangeTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mPlayer <> Nil Then libvlc_media_player_release(mPlayer)
		  mPlayer = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EmbeddedWithin() As Integer
		  ' Returns an OS-specific handle to the window or control in which the player's video output is embedded.
		  ' Use the EmbedWithin method to specify the window or control.
		  
		  If mPlayer = Nil Then Return 0
		  #If TargetWin32 Then
		    Return libvlc_media_player_get_hwnd(mPlayer)
		  #ElseIf TargetMacOS
		    Return libvlc_media_player_get_nsobject(mPlayer)
		  #Else
		    Return libvlc_media_player_get_xwindow(mPlayer)
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmbedWithin(Parent As Integer)
		  ' Pass the OS-specific handle of a Window, ContainerControl, or RectControl as 'Parent'. The video output (if any) superimposes
		  ' and obscures the Parent, and will move/resize automatically when the parent does.
		  
		  If mPlayer = Nil Then Raise New NilObjectException
		  #If TargetWin32 Then
		    libvlc_media_player_set_hwnd(mPlayer, Parent)
		  #ElseIf TargetMacOS
		    libvlc_media_player_set_nsobject(mPlayer, Parent)
		  #Else
		    libvlc_media_player_set_xwindow(mPlayer, Parent)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = TargetHasGUI
		Sub EmbedWithin(Parent As RectControl)
		  ' Pass a subclass of rectcontrol as 'Parent'. The video output (if any) superimposes and obscures the Parent, and
		  ' will move/resize automatically when the parent does.
		  
		  Me.EmbedWithin(Parent.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = TargetHasGUI
		Sub EmbedWithin(Parent As Window)
		  ' Pass a subclass of Window (or a ContainerControl) as 'Parent'. The video output (if any) superimposes and obscures the Parent, and
		  ' will move/resize automatically when the parent does.
		  
		  Me.EmbedWithin(Parent.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCursorXY(Optional VideoIndex As Integer) As REALbasic.Point
		  ' Returns the mouse position relative to the video's unscaled size (i.e. not in screen pixels)
		  ' VLC supports multiple video streams. If you want a stream other than the first/only one, pass the index.
		  
		  If mPlayer = Nil Then Return Nil
		  Dim x, y As Integer
		  If libvlc_video_get_cursor(mPlayer, VideoIndex, x, y) <> 0 Then Return Nil
		  Return New REALbasic.Point(x, y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVideoDimensions(Optional VideoIndex As Integer) As REALbasic.Rect
		  ' Returns the video's unscaled dimensions. VLC supports multiple video streams. If you want a stream other
		  ' than the first/only one, pass the index.
		  
		  If mPlayer = Nil Then Return Nil
		  Dim w, h As Integer
		  If libvlc_video_get_size(mPlayer, VideoIndex, w, h) <> 0 Then Return Nil
		  Return New REALbasic.Rect(0, 0, w, h)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mPlayer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Load(MediaFile As FolderItem) As libvlc.VLCPlayer
		  Return Load(MediaFile.URLPath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Load(MediaURL As String) As libvlc.VLCPlayer
		  Dim m As Medium = MediaURL
		  If m <> Nil Then Return New libvlc.VLCPlayer(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Media() As libvlc.Medium
		  If mMedium = Nil Then
		    If mPlayer <> Nil Then
		      Dim p As Ptr = libvlc_media_player_get_media(mPlayer)
		      If p <> Nil Then mMedium = p
		    End If
		  End If
		  Return mMedium
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Media(Assigns NewMedium As libvlc.Medium)
		  If mPlayer <> Nil Then
		    Me.Stop()
		    If NewMedium <> Nil Then
		      libvlc_media_player_set_media(mPlayer, NewMedium.Handle)
		    Else
		      libvlc_media_player_set_media(mPlayer, Nil)
		    End If
		    mMedium = NewMedium
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetaData() As libvlc.Meta.MetaData
		  Dim m As libvlc.Medium = Media
		  If m <> Nil Then
		    If Not m.IsParsed Then m.Parse
		    Return New libvlc.Meta.MetaData(m)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherInstance As libvlc.VLCPlayer) As Integer
		  Dim i As Integer = Super.Operator_Compare(OtherInstance)
		  If i = 0 Then i = Sign(Integer(mPlayer) - Integer(OtherInstance.mPlayer))
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  If mPlayer <> Nil Then libvlc_media_player_set_pause(mPlayer, 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  If mPlayer <> Nil Then
		    If libvlc_media_player_play(mPlayer) <> 0 Then Raise New VLCException("The player cannot play the current media.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resume()
		  If mPlayer <> Nil Then libvlc_media_player_set_pause(mPlayer, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAudioOutput(Index As Integer)
		  If mPlayer = Nil Then Raise New NilObjectException
		  Dim l As libvlc.Meta.AudioOutputList = AudioOutputs
		  If l = Nil Then Raise New VLCException("No audio outputs detected!")
		  If libvlc_audio_output_set(mPlayer, l.Name(Index)) <> 0 Then Raise New VLCException("Unable to set the audio output to that index.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetSubtitleFile(SubtitleFile As FolderItem) As Boolean
		  If mPlayer <> Nil Then Return libvlc_video_set_subtitle_file(mPlayer, SubtitleFile.AbsolutePath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StateChangeTimerHandler(Sender As Timer)
		  #pragma Unused Sender
		  If mPlayer <> Nil And Me.CurrentState <> mLastState Then
		    mLastState = Me.CurrentState
		    RaiseEvent ChangedState()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  If mPlayer <> Nil Then libvlc_media_player_stop(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubtitleCount() As Integer
		  If mPlayer <> Nil Then Return libvlc_video_get_spu_count(mPlayer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SubtitleIndex() As Integer
		  If mPlayer <> Nil Then Return libvlc_video_get_spu(mPlayer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SubtitleIndex(Assigns NewIndex As Integer)
		  If mPlayer = Nil Then Return
		  If libvlc_video_set_spu(mPlayer, NewIndex) <> 0 Then Raise New VLCException("Unable to assign that subtitle index.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Subtitles() As libvlc.Meta.TrackList
		  If mPlayer = Nil Then Return Nil
		  Dim p As Ptr = libvlc_video_get_spu_description(mPlayer)
		  If p <> Nil Then Return New libvlc.Meta.TrackList(p)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TakeSnapshot(Optional VideoIndex As Integer) As Picture
		  If mPlayer = Nil Then Return Nil
		  
		  Dim tmp As FolderItem = GetTemporaryFolderItem()
		  Dim r As REALbasic.Rect = GetVideoDimensions()
		  If r <> Nil And libvlc_video_take_snapshot(mPlayer, VideoIndex, tmp.AbsolutePath, r.Width, r.Height) = 0 Then
		    Return Picture.Open(tmp)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleFullscreen()
		  If mPlayer <> Nil Then libvlc_toggle_fullscreen(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleTeletext()
		  If mPlayer <> Nil Then libvlc_toggle_teletext(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoAdjustment(Option As libvlc.AdjustOption) As Integer
		  If mPlayer <> Nil Then Return libvlc_video_get_adjust_int(mPlayer, UInt32(Option))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VideoAdjustment(Option As libvlc.AdjustOption, Assigns NewValue As Integer)
		  If mPlayer <> Nil Then libvlc_video_set_adjust_int(mPlayer, UInt32(Option), NewValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function VideoFilters() As libvlc.Meta.ModuleList
		  Dim i As New VLCInstance
		  Return New libvlc.Meta.ModuleList(libvlc_video_filter_list_get(i.Instance))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoTrack() As Integer
		  If mPlayer <> Nil Then Return libvlc_video_get_track(mPlayer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VideoTrack(Assigns NewTrack As Integer)
		  If mPlayer = Nil Then Raise New NilObjectException
		  If libvlc_video_set_track(mPlayer, NewTrack) <> 0 Then Raise New VLCException("Unable to set the video track to that index.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoTrackCount() As Integer
		  Dim lst As libvlc.Meta.TrackList = Me.VideoTracks
		  If lst <> Nil Then Return lst.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoTrackDescription(TrackNumber As Integer) As String
		  Dim lst As libvlc.Meta.TrackList = Me.VideoTracks
		  If lst <> Nil Then Return lst.Name(TrackNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoTrackID(TrackNumber As Integer) As Integer
		  Dim lst As libvlc.Meta.TrackList = Me.VideoTracks
		  If lst <> Nil Then Return lst.ID(TrackNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoTrackIndex(TrackID As Integer) As Integer
		  ' Returns the index of the Video Track corresponding to TrackID, or -1
		  
		  Dim lst As libvlc.Meta.TrackList = Me.VideoTracks
		  If lst <> Nil Then 
		    Dim c As Integer = lst.Count
		    For i As Integer = 0 To c - 1
		      If lst.ID(i) = TrackID Then Return i
		    Next
		  End If
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function VideoTracks() As libvlc.Meta.TrackList
		  If mPlayer = Nil Then Return Nil
		  Dim p As Ptr = libvlc_video_get_track_description(mPlayer)
		  If p <> Nil Then Return New libvlc.Meta.TrackList(p)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ChangedState()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then
			    Dim mb As MemoryBlock = libvlc_video_get_aspect_ratio(mPlayer)
			    If mb <> Nil Then
			      Dim s As String = mb.CString(0)
			      libvlc_free(mb)
			      Return s
			    End If
			  End If
			End Get
		#tag EndGetter
		AspectRatio As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_player_can_pause(mPlayer)
			End Get
		#tag EndGetter
		CanPause As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_player_will_play(mPlayer)
			End Get
		#tag EndGetter
		CanPlay As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_player_is_seekable(mPlayer)
			End Get
		#tag EndGetter
		CanSeek As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCaptureKeyboard
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then
			    libvlc_video_set_key_input(mPlayer, value)
			    mCaptureKeyboard = value
			  End If
			End Set
		#tag EndSetter
		CaptureKeyboard As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mCaptureMouse
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then
			    libvlc_video_set_mouse_input(mPlayer, value)
			    mCaptureMouse = value
			  End If
			End Set
		#tag EndSetter
		CaptureMouse As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_player_get_state(mPlayer)
			End Get
		#tag EndGetter
		CurrentState As libvlc.PlayerState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDeinterlace
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <> "" Then
			    Dim mb As New MemoryBlock(value.Len + 1)
			    mb.CString(0) = value
			    libvlc_video_set_deinterlace(mPlayer, mb)
			    mDeinterlace = value
			  Else
			    libvlc_video_set_deinterlace(mPlayer, Nil)
			    mDeinterlace = ""
			  End If
			End Set
		#tag EndSetter
		Deinterlace As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mEqualizer = Nil Then mEqualizer = New libvlc.Equalizer
			  return mEqualizer
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer = Nil Then Return
			  If libvlc_media_player_set_equalizer(mPlayer, value.Handle) <> 0 Then Raise New VLCException("Unable to assign the equalizer to this player.")
			  mEqualizer = value
			End Set
		#tag EndSetter
		Equalizer As libvlc.Equalizer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_get_fullscreen(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then libvlc_set_fullscreen(mPlayer, value)
			End Set
		#tag EndSetter
		Fullscreen As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.AudioTrackCount > 0
			End Get
		#tag EndGetter
		HasAudio As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SubtitleCount > 0
			End Get
		#tag EndGetter
		HasSubtitles As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.VideoTrackCount > 0
			End Get
		#tag EndGetter
		HasVideo As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_player_is_playing(mPlayer)
			End Get
		#tag EndGetter
		IsPlaying As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_player_get_length(mPlayer)
			End Get
		#tag EndGetter
		LengthMS As Int64
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCaptureKeyboard As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaptureMouse As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDeinterlace As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEqualizer As libvlc.Equalizer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastState As libvlc.PlayerState
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMedium As libvlc.Medium
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlayer As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStateChangeTimer As Timer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_audio_get_mute(mPlayer) = 1
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then libvlc_audio_set_mute(mPlayer, value)
			End Set
		#tag EndSetter
		Muted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_player_get_position(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then libvlc_media_player_set_position(mPlayer, value)
			End Set
		#tag EndSetter
		Position As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_video_get_scale(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then libvlc_video_set_scale(mPlayer, value)
			End Set
		#tag EndSetter
		Scale As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_player_get_rate(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then libvlc_media_player_set_rate(mPlayer, value)
			End Set
		#tag EndSetter
		Speed As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_player_get_time(mPlayer)
			End Get
		#tag EndGetter
		TimeMS As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_audio_get_volume(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then
			    If libvlc_audio_set_volume(mPlayer, value) = -1 Then Raise New VLCException("Volume percent is out of range (0-100)")
			  End If
			End Set
		#tag EndSetter
		Volume As Integer
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
			Name="AspectRatio"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanPause"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanPlay"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanSeek"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaptureKeyboard"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaptureMouse"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Deinterlace"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fullscreen"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasAudio"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasSubtitles"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasVideo"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsPlaying"
			Group="Behavior"
			Type="Boolean"
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
			Name="Muted"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Position"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Scale"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Speed"
			Group="Behavior"
			Type="Single"
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
		#tag ViewProperty
			Name="Volume"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
