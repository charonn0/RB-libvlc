#tag Class
Class VLCPlayer
	#tag Method, Flags = &h0
		Function AddInterface(InterfaceName As String) As Boolean
		  Return libvlc_add_intf(mInstance.Handle, InterfaceName) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' Constructs a new player instance
		  
		  mInstance = VLCInstance.GetInstance
		  mPlayer = libvlc_media_player_new(mInstance.Handle)
		  If mPlayer = Nil Then Raise New libvlc.VLCException("Unable to construct a player instance.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Medium As libvlc.VLCMedium)
		  ' Constructs a new player instance from the passed media reference
		  
		  mInstance = Medium.Instance
		  mPlayer = libvlc_media_player_new_from_media(Medium.Handle)
		  If mPlayer = Nil Then Raise New libvlc.VLCException("Unable to construct a player instance.")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  ' Takes ownership of the passed player ref
		  
		  If FromPtr = Nil Then Raise New NilObjectException
		  If AddRef Then libvlc_media_player_retain(FromPtr)
		  mInstance = VLCInstance.GetInstance
		  mPlayer = FromPtr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mPlayer <> Nil Then libvlc_media_player_release(mPlayer)
		  mPlayer = Nil
		  mInstance = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub EmbedWithin(Parent As Integer)
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
		  
		  Me.EmbedWithin(Parent.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = TargetHasGUI
		Sub EmbedWithin(Parent As Window)
		  
		  Me.EmbedWithin(Parent.Handle)
		End Sub
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
		  Dim m As New VLCMedium(MediaURL)
		  If m <> Nil Then Return New libvlc.VLCPlayer(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Media() As libvlc.VLCMedium
		  If mPlayer <> Nil Then 
		    Dim p As Ptr = libvlc_media_player_get_media(mPlayer)
		    If p <> Nil Then Return p
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Media(Assigns NewMedium As libvlc.VLCMedium)
		  If mPlayer <> Nil Then libvlc_media_player_set_media(mPlayer, NewMedium.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetaData() As libvlc.MetaData
		  If Media <> Nil Then
		    If Not Media.IsParsed Then Media.Parse
		    Return New libvlc.MetaData(Media)
		  End If
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
		Sub Stop()
		  If mPlayer <> Nil Then libvlc_media_player_stop(mPlayer)
		End Sub
	#tag EndMethod


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
			  If mPlayer <> Nil Then Return libvlc_media_player_get_state(mPlayer)
			End Get
		#tag EndGetter
		CurrentState As libvlc.PlayerState
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
		Private mEqualizer As libvlc.Equalizer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInstance As VLCInstance
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlayer As Ptr
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
			  If mPlayer <> Nil Then Return libvlc_media_player_get_position(mPlayer) * 100
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then libvlc_media_player_set_position(mPlayer, value / 100)
			End Set
		#tag EndSetter
		Position As Single
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="Volume"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
