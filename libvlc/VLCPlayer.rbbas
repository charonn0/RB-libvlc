#tag Class
Class VLCPlayer
Inherits libvlc.VLCInstance
	#tag Method, Flags = &h0
		Function AddInterface(InterfaceName As String) As Boolean
		  ' Adds an interface to the instance.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.AddInterface
		  ' https://wiki.videolan.org/Interfaces/
		  
		  Return libvlc_add_intf(Me.Instance, InterfaceName) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' Constructs a new player instance
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Constructor
		  
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From VLCInstance
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
		Sub Constructor(Medium As libvlc.Medium)
		  ' Constructs a new player instance from the passed media reference
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Constructor
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(AddRef As VLCInstance) -- From VLCInstance
		  Super.Constructor(Medium)
		  mPlayer = libvlc_media_player_new_from_media(Medium.Handle)
		  If mPlayer = Nil Then Raise New libvlc.VLCException("Unable to construct a player instance.")
		  
		  mStateChangeTimer = New Timer
		  mStateChangeTimer.Period = 150
		  AddHandler mStateChangeTimer.Action, WeakAddressOf StateChangeTimerHandler
		  mStateChangeTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  ' Takes ownership of the passed player ref
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Constructor
		  
		  If FromPtr = Nil Then Raise New NilObjectException
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From VLCInstance
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
		Sub EmbedWithin(Parent As Integer)
		  ' Pass the OS-specific handle of a Window, ContainerControl, or RectControl
		  ' as 'Parent'. The video output (if any) superimposes and obscures the Parent,
		  ' and will move/resize automatically when the parent does.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.EmbedWithin
		  
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
		  ' Pass a subclass of rectcontrol as 'Parent'. The video output (if any)
		  ' superimposes and obscures the Parent, and will move/resize automatically
		  ' when the parent does.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.EmbedWithin
		  
		  Me.EmbedWithin(Parent.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = TargetHasGUI
		Sub EmbedWithin(Parent As Window)
		  ' Pass a subclass of Window (or a ContainerControl) as 'Parent'. The video
		  ' output (if any) superimposes and obscures the Parent, and will move/resize
		  ' automatically when the parent does.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.EmbedWithin
		  
		  Me.EmbedWithin(Parent.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCursorXY(Optional VideoIndex As Integer) As REALbasic.Point
		  ' Returns the mouse position relative to the video's unscaled size (i.e. not
		  ' in screen pixels). VLC supports multiple video streams. If you want a stream
		  ' other than the first/only one, pass the index.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.GetCursorXY
		  
		  If mPlayer = Nil Then Return Nil
		  Dim x, y As Integer
		  If libvlc_video_get_cursor(mPlayer, VideoIndex, x, y) <> 0 Then Return Nil
		  Return New REALbasic.Point(x, y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVideoDimensions(Optional VideoIndex As Integer) As REALbasic.Rect
		  ' Returns the video's unscaled dimensions. VLC supports multiple
		  ' video streams. If you want a stream other than the first/only
		  ' one, pass the index.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.GetVideoDimensions
		  
		  If mPlayer = Nil Then Return Nil
		  Dim w, h As Integer
		  If libvlc_video_get_size(mPlayer, VideoIndex, w, h) <> 0 Then Return Nil
		  Return New REALbasic.Rect(0, 0, w, h)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Load(MediaFile As FolderItem) As libvlc.VLCPlayer
		  ' Returns a new VLCPlayer instance with the media file or URL already set
		  ' to the specified media.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Load
		  
		  Return Load(MediaFile.URLPath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Load(MediaURL As String) As libvlc.VLCPlayer
		  ' Returns a new VLCPlayer instance with the media file or URL already set
		  ' to the specified media.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Load
		  
		  Dim m As Medium = MediaURL
		  If m <> Nil Then Return New libvlc.VLCPlayer(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NavigateMenu(Mode As libvlc.NavigationMode)
		  ' Use this method to navigate a DVD menu. Pass a member of the NavigationMode enum.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.NavigateMenu
		  
		  If mPlayer <> Nil Then libvlc_media_player_navigate(mPlayer, Mode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NextFrame()
		  ' Display the next frame (if supported).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.NextFrame
		  
		  If mPlayer <> Nil Then libvlc_media_player_next_frame(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherInstance As libvlc.VLCPlayer) As Integer
		  ' Compares two VLCPlayer references for equality. References are considered
		  ' equal if they refer to the same underlying libvlc handle.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Operator_Compare
		  
		  Dim i As Integer = Super.Operator_Compare(OtherInstance)
		  If i = 0 Then i = Sign(Integer(mPlayer) - Integer(OtherInstance.mPlayer))
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  ' Pauses playback, if playing.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Pause
		  
		  If mPlayer <> Nil Then libvlc_media_player_set_pause(mPlayer, 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pause() As Boolean
		  ' Pauses playback, if playing.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Pause
		  
		  If mPlayer = Nil Then Return False
		  Try
		    Me.Pause()
		  Catch
		    Return False
		  End Try
		  Do Until Me.CurrentState = libvlc.PlayerState.Paused
		    #If TargetDesktop Then
		      App.SleepCurrentThread(100)
		    #Else
		      App.DoEvents(100)
		    #EndIf
		  Loop Until Me.CurrentState = libvlc.PlayerState.Error
		  
		  Return Me.CurrentState = libvlc.PlayerState.Paused
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  ' Begins or resumes playback if there is a medium set. 
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Play
		  
		  If mPlayer <> Nil Then
		    If libvlc_media_player_play(mPlayer) <> 0 Then Raise New VLCException("The player cannot play the current media.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Play(StartPaused As Boolean = False) As Boolean
		  ' Begins or resumes playback if there is a medium set. If StartPaused=True then
		  ' the current medium is loaded and then put into the "paused" state. Returns True
		  ' if the medium was loaded/started(/paused) successfully.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Play
		  
		  If mPlayer = Nil Then Return False
		  Try
		    Me.Play()
		  Catch
		    Return False
		  End Try
		  Do
		    Select Case Me.CurrentState
		    Case libvlc.PlayerState.Buffering, libvlc.PlayerState.Idle, libvlc.PlayerState.Opening
		      App.YieldToNextThread
		      Continue
		    Case libvlc.PlayerState.Playing
		      If StartPaused Then Me.Pause
		      #If TargetDesktop Then
		        App.SleepCurrentThread(100)
		      #Else
		        App.DoEvents(100)
		      #EndIf
		      Return True
		    Else
		      Return False
		    End Select
		  Loop
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resume()
		  ' Resumes playback if it was previously paused. No effect if there is no medium.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Resume
		  
		  If mPlayer <> Nil Then libvlc_media_player_set_pause(mPlayer, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAudioOutput(Index As Integer)
		  ' Selects an audio output module.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.SetAudioOutput
		  
		  If mPlayer = Nil Then Raise New NilObjectException
		  Dim l As libvlc.Meta.AudioOutputList = AudioOutputs
		  If l = Nil Then Raise New VLCException("No audio outputs detected!")
		  If libvlc_audio_output_set(mPlayer, l.Name(Index)) <> 0 Then Raise New VLCException("Unable to set the audio output to that index.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetSubtitleFile(SubtitleFile As FolderItem) As Boolean
		  ' Set new video subtitle file.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.SetSubtitleFile
		  
		  If mPlayer <> Nil Then Return libvlc_video_set_subtitle_file(mPlayer, SubtitleFile.AbsolutePath_)
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
		  ' Stops playback if playing.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Stop
		  
		  If mPlayer <> Nil Then libvlc_media_player_stop(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Stop() As Boolean
		  ' Stops playback if playing. Returns True once playback has come to a
		  ' complete stop.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Stop
		  
		  If mPlayer = Nil Then Return False
		  Try
		    Me.Stop()
		  Catch
		    Return False
		  End Try
		  Do Until Me.CurrentState = libvlc.PlayerState.Stopping
		    #If TargetDesktop Then
		      App.SleepCurrentThread(100)
		    #Else
		      App.DoEvents(100)
		    #EndIf
		  Loop Until Me.CurrentState = libvlc.PlayerState.Error
		  
		  Return Me.CurrentState = libvlc.PlayerState.Stopping
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TakeSnapshot(Optional VideoIndex As Integer) As Picture
		  ' Captures a frame from the video stream. VLC supports multiple video streams; if you want a stream
		  ' other than the first/only one, pass the index.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.TakeSnapshot
		  
		  If mPlayer = Nil Then Return Nil
		  
		  Dim tmp As FolderItem = GetTemporaryFolderItem()
		  Dim r As REALbasic.Rect = GetVideoDimensions(VideoIndex)
		  If r <> Nil And libvlc_video_take_snapshot(mPlayer, VideoIndex, tmp.AbsolutePath_, r.Width, r.Height) = 0 Then
		    Return Picture.Open(tmp)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ToggleFullscreen()
		  ' Toggles fullscreen mode on and off. Only available if the player is
		  ' not embedded in a control or window.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.ToggleFullScreen
		  
		  If mPlayer <> Nil Then libvlc_toggle_fullscreen(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoAdjustment(Option As libvlc.AdjustOption) As Single
		  ' Gets the value of the specified video adjustment option.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.VideoAdjustment
		  
		  If mPlayer <> Nil Then 
		    Dim value As Single = libvlc_video_get_adjust_float(mPlayer, CType(Option, UInt32))
		    If value <= 0.000 Then
		      value = libvlc_video_get_adjust_int(mPlayer, CType(Option, UInt32))
		    End If
		    Return value
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub VideoAdjustment(Option As libvlc.AdjustOption, Assigns NewValue As Single)
		  ' Sets the value of the specified video adjustment option.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.VideoAdjustment
		  
		  If mPlayer <> Nil Then libvlc_video_set_adjust_float(mPlayer, CType(Option, UInt32), NewValue)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ChangedState()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the video aspect ratio, as a string. e.g. "16:9" or "4:3"
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.AspectRatio
			  
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
		#tag Setter
			Set
			  ' Sets the video aspect ratio, as a string. e.g. "16:9" or "4:3"
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.AspectRatio
			  
			  If mPlayer <> Nil Then
			    If value <> "" Then
			      libvlc_video_set_aspect_ratio(mPlayer, value)
			    Else
			      libvlc_video_set_aspect_ratio(mPlayer, Nil)
			    End If
			  End If
			End Set
		#tag EndSetter
		AspectRatio As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns a AudioTrackList object containing information about
			  ' available audio tracks.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.AudioTracks
			  
			  If mPlayer = Nil Then Return Nil
			  Dim p As Ptr = libvlc_audio_get_track_description(mPlayer)
			  If p <> Nil Then Return New libvlc.Meta.AudioTrackList(p, Me)
			End Get
		#tag EndGetter
		AudioTracks As libvlc.Meta.AudioTrackList
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the True if the current medium can be paused.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.CanPause
			  
			  If mPlayer <> Nil Then Return libvlc_media_player_can_pause(mPlayer)
			End Get
		#tag EndGetter
		CanPause As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the True if the current medium can be played.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.CanPlay
			  
			  If mPlayer <> Nil Then Return libvlc_media_player_will_play(mPlayer)
			End Get
		#tag EndGetter
		CanPlay As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the True if the current medium can seek (rewind/fast-forward).
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.CanSeek
			  
			  If mPlayer <> Nil Then Return libvlc_media_player_is_seekable(mPlayer)
			End Get
		#tag EndGetter
		CanSeek As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets whether VLC handles key press events, according to the LibVLC hotkeys configuration.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.CaptureKeyboard
			  
			  Return mCaptureKeyboard
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets whether VLC handles key press events, according to the LibVLC hotkeys configuration.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.CaptureKeyboard
			  
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
			  ' Gets whether VLC handles mouse events.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.CaptureMouse
			  
			  Return mCaptureMouse
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets whether VLC handles mouse events.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.CaptureMouse
			  
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
			  ' The current state of the player. Refer to the libvlc.PlayerState enum for possible values.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.CurrentState
			  
			  If mPlayer <> Nil Then Return libvlc_media_player_get_state(mPlayer)
			End Get
		#tag EndGetter
		CurrentState As libvlc.PlayerState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  '
			  ' See:
			  '
			  
			  return mDeinterlace
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the deinterlace filter. Set to the empty string ("") to disable.
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Deinterlace
			  
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
			  ' Returns an OS-specific handle to the window or control in which the
			  ' player's video output is embedded. Use the EmbedWithin() method to
			  ' specify the window or control.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.EmbeddedWithin
			  
			  If mPlayer = Nil Then Return 0
			  #If TargetWin32 Then
			    Return libvlc_media_player_get_hwnd(mPlayer)
			  #ElseIf TargetMacOS
			    Return libvlc_media_player_get_nsobject(mPlayer)
			  #Else
			    Return libvlc_media_player_get_xwindow(mPlayer)
			  #endif
			  
			End Get
		#tag EndGetter
		EmbeddedWithin As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets an Equalizer object that represents the current audio equalizer values.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Equalizer
			  
			  If mEqualizer = Nil Then mEqualizer = New libvlc.Equalizer
			  return mEqualizer
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets an Equalizer object that represents the current audio equalizer values.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Equalizer
			  
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
			  ' Gets whether VLC is in fullscreen mode. Only available if the player is not
			  ' embedded in a control or window.
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Fullscreen
			  
			  If mPlayer <> Nil Then Return libvlc_get_fullscreen(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets whether VLC is in fullscreen mode. Only available if the player is not
			  ' embedded in a control or window.
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Fullscreen
			  
			  If mPlayer <> Nil Then libvlc_set_fullscreen(mPlayer, value)
			End Set
		#tag EndSetter
		Fullscreen As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the VLC handle for the player.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Handle
			  
			  Return mPlayer
			End Get
		#tag EndGetter
		Handle As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the True if the current medium has at least one audio track.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.HasAudio
			  
			  If Me.AudioTracks = Nil Then Return False
			  Return Me.AudioTracks.Count > 0
			End Get
		#tag EndGetter
		HasAudio As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the True if the current medium has at least one subtitles track.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.HasSubtitles
			  
			  If Me.Subtitles = Nil Then Return False
			  Return Me.Subtitles.Count > 0
			End Get
		#tag EndGetter
		HasSubtitles As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the True if the current medium has at least one video track.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.HasVideo
			  
			  If Me.VideoTracks = Nil Then Return False
			  Return Me.VideoTracks.Count > 0
			End Get
		#tag EndGetter
		HasVideo As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns True if the player is currently playing. 
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.IsPlaying
			  
			  If mPlayer <> Nil Then Return libvlc_media_player_is_playing(mPlayer)
			End Get
		#tag EndGetter
		IsPlaying As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the total length of the currently playing medium, in milliseconds.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.LengthMS
			  
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the current Medium for the player.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Media
			  
			  If mPlayer = Nil Then Return Nil
			  Dim p As Ptr = libvlc_media_player_get_media(mPlayer)
			  If p <> Nil Then Return New MediumPtr(p, True)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets and sets the current Medium for the player. Because the Medium class can
			  ' automatically convert from a FolderItem or String, you may assign a FolderItem
			  ' or string to this property directly.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Media
			  
			  If mPlayer = Nil Then Return
			  Me.Stop()
			  If value <> Nil Then
			    libvlc_media_player_set_media(mPlayer, value.Handle)
			  Else
			    libvlc_media_player_set_media(mPlayer, Nil)
			  End If
			  
			End Set
		#tag EndSetter
		Media As libvlc.Medium
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mEqualizer As libvlc.Equalizer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastState As libvlc.PlayerState
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
			  ' Gets whether the audio is muted.
			  ' 
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Muted
			  
			  If mPlayer <> Nil Then Return libvlc_audio_get_mute(mPlayer) = 1
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets whether the audio is muted.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Muted
			  
			  If mPlayer <> Nil Then libvlc_audio_set_mute(mPlayer, value)
			End Set
		#tag EndSetter
		Muted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the current playback position, as a percentage of the whole
			  ' length, expressed as a number between 0.0 and 1.0.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Position
			  
			  If mPlayer <> Nil Then Return libvlc_media_player_get_position(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the current playback position, as a percentage of the whole
			  ' length, expressed as a number between 0.0 and 1.0.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Position
			  
			  If mPlayer <> Nil Then libvlc_media_player_set_position(mPlayer, value)
			End Set
		#tag EndSetter
		Position As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the current scaling factor.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Scale
			  
			  If mPlayer <> Nil Then Return libvlc_video_get_scale(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the current scaling factor.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Scale
			  
			  If mPlayer <> Nil Then libvlc_video_set_scale(mPlayer, value)
			End Set
		#tag EndSetter
		Scale As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the current playback speed.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Speed
			  
			  If mPlayer <> Nil Then Return libvlc_media_player_get_rate(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the current playback speed.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Speed
			  
			  If mPlayer <> Nil Then libvlc_media_player_set_rate(mPlayer, value)
			End Set
		#tag EndSetter
		Speed As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns a SubtitlesTrackList object containing information
			  ' about available subtitle tracks.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Subtitles
			  
			  If mPlayer = Nil Then Return Nil
			  Dim p As Ptr = libvlc_video_get_spu_description(mPlayer)
			  If p <> Nil Then
			    Return New libvlc.Meta.SubtitlesTrackList(p, Me)
			  End If
			End Get
		#tag EndGetter
		Subtitles As libvlc.Meta.SubtitlesTrackList
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the position of the currently playing medium, in milliseconds.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.TimeMS
			  
			  If mPlayer <> Nil Then Return libvlc_media_player_get_time(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the position of the currently playing medium, in milliseconds.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.TimeMS
			  
			  If mPlayer <> Nil Then libvlc_media_player_set_time(mPlayer, value)
			End Set
		#tag EndSetter
		TimeMS As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns a VideoTrackList object containing information about available
			  ' video tracks.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.VideoTracks
			  
			  If mPlayer = Nil Then Return Nil
			  Dim p As Ptr = libvlc_video_get_track_description(mPlayer)
			  If p <> Nil Then Return New libvlc.Meta.VideoTrackList(p, Me)
			End Get
		#tag EndGetter
		VideoTracks As libvlc.Meta.VideoTrackList
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the current audio volume as a percent of maximum (0-100).
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Volume
			  
			  If mPlayer <> Nil Then Return libvlc_audio_get_volume(mPlayer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the current audio volume as a percent of maximum (0-100).
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.Volume
			  
			  If mPlayer <> Nil And Me.CurrentState = libvlc.PlayerState.Playing Then
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
