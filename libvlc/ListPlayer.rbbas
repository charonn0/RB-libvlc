#tag Class
Protected Class ListPlayer
Implements VLCHandle
	#tag Method, Flags = &h0
		Function CanMoveNext() As Boolean
		  
		  Return mPlayList <> Nil And mListIndex < mPlayList.Count - 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanMovePrev() As Boolean
		  
		  Return mPlayList <> Nil And mListIndex > 0
		End Function
	#tag EndMethod

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

	#tag Method, Flags = &h0, CompatibilityFlags = TargetHasGUI
		Sub EmbedWithin(Parent As RectControl)
		  
		  TruePlayer.EmbedWithin(Parent)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = TargetHasGUI
		Sub EmbedWithin(Parent As Window)
		  
		  TruePlayer.EmbedWithin(Parent)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  // Part of the libvlc.VLCHandle interface.
		  Return mPlayer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveNext() As Boolean
		  If mPlayer <> Nil Then Return libvlc_media_list_player_next(mPlayer) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MovePrev() As Boolean
		  If mPlayer <> Nil Then Return libvlc_media_list_player_previous(mPlayer) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  If mPlayer <> Nil Then libvlc_media_list_player_pause(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  If mPlayer <> Nil Then 
		    mListIndex = 0
		    libvlc_media_list_player_play(mPlayer)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(Index As Integer)
		  If mPlayer <> Nil Then 
		    If libvlc_media_list_player_play_item_at_index(mPlayer, Index) <> 0 Then
		      Raise New VLCException("The media list does not contain an entry at that index.")
		    End If
		    mListIndex = Index
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(MediaURL As String)
		  If mPlayer <> Nil Then 
		    Dim index As Integer = mPlayList.IndexOf(MediaURL)
		    If index > -1 Then
		      Dim m As VLCMedium = mPlayList.Item(index)
		      If libvlc_media_list_player_play_item(mPlayer, m.Handle) = 0 Then Return
		    End If
		    Raise New VLCException("That media is not included in the media list.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  If mPlayer <> Nil Then libvlc_media_list_player_stop(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TruePlayer() As libvlc.VLCPlayer
		  If mPlayer = Nil Then mPlayer = libvlc_media_list_player_get_media_player(mPlayer)
		  If mPlayer <> Nil Then Return New libvlc.VLCPlayer(mPlayer, False)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TruePlayer(Assigns NewVLCPlayer As libvlc.VLCPlayer)
		  If mPlayer = Nil Then Raise New NilObjectException
		  libvlc_media_list_player_set_media_player(mPlayer, NewVLCPlayer.Handle)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About this class
		This class plays a PlayList object containing one or more VLCMedium objects
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_list_player_get_state(mPlayer)
			End Get
		#tag EndGetter
		CurrentState As libvlc.PlayerState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return libvlc_media_list_player_is_playing(mPlayer)
			End Get
		#tag EndGetter
		IsPlaying As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mListIndex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Play(value)
			  Me.Pause
			End Set
		#tag EndSetter
		ListIndex As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mInstance As VLCInstance
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mListIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPlayer As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mPlayList As libvlc.PlayList
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlayMode As libvlc.PlaybackMode = libvlc.PlaybackMode.Default
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mPlayList
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then 
			    libvlc_media_list_player_set_media_list(mPlayer, value.Handle)
			    mPlayList = value
			  End If
			End Set
		#tag EndSetter
		Playlist As libvlc.PlayList
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPlayMode
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then 
			    libvlc_media_list_player_set_playback_mode(mPlayer, value)
			    mPlayMode = value
			  End If
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
			Name="ListIndex"
			Group="Behavior"
			Type="Integer"
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
