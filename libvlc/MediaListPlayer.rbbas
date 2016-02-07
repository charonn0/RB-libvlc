#tag Class
Protected Class MediaListPlayer
	#tag Method, Flags = &h0
		Sub Constructor()
		  mInstance = VLCInstance.GetInstance
		  mPlayer = libvlc_media_list_player_new(mInstance.Handle)
		  If mPlayer = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC media list player.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mPlayer <> Nil Then libvlc_media_list_player_release(mPlayer)
		  mPlayer = Nil
		  mInstance = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveNext() As Boolean
		  Return libvlc_media_list_player_next(mPlayer) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MovePrev() As Boolean
		  Return libvlc_media_list_player_previous(mPlayer) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  libvlc_media_list_player_pause(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  libvlc_media_list_player_play(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(Index As Integer)
		  If libvlc_media_list_player_play_item_at_index(mPlayer, Index) <> 0 Then Raise New VLCException("The media list does not contain an entry at that index.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(MediaURL As String)
		  Dim m As New VLCMedium(MediaURL)
		  If libvlc_media_list_player_play_item(mPlayer, m.Handle) <> 0 Then Raise New VLCException("That media is not included in the media list.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  libvlc_media_list_player_stop(mPlayer)
		End Sub
	#tag EndMethod


	#tag Note, Name = About this class
		This class plays a MediaList object containing one or more VLCMedium objects
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return libvlc_media_list_player_get_state(mPlayer)
			End Get
		#tag EndGetter
		CurrentState As libvlc.PlayerState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return libvlc_media_list_player_is_playing(mPlayer)
			End Get
		#tag EndGetter
		IsPlaying As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mInstance As VLCInstance
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPlayer As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPlaylist As libvlc.MediaList
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlayMode As libvlc.PlaybackMode = libvlc.PlaybackMode.Default
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim p As Ptr = libvlc_media_list_media(mPlaylist.Handle)
			  If p <> Nil Then Return p
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  libvlc_media_list_player_set_media_list(mPlaylist.Handle, value.Handle)
			End Set
		#tag EndSetter
		Playlist As libvlc.MediaList
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPlayMode
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  libvlc_media_list_player_set_playback_mode(mPlayer, value)
			  mPlayMode = value
			End Set
		#tag EndSetter
		PlayMode As libvlc.PlaybackMode
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
