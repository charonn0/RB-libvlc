#tag Class
Protected Class ListPlayer
Inherits libvlc.VLCInstance
	#tag Method, Flags = &h0
		Sub Append(Medium As libvlc.Medium)
		  ' Append a medium to the playlist.
		  
		  PlayList.Append(Medium)
		  Playlist = Playlist
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From VLCInstance
		  Super.Constructor()
		  mPlayer = libvlc_media_list_player_new(Me.Instance)
		  If mPlayer = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC media list player.")
		  mStateChangeTimer = New Timer
		  mStateChangeTimer.Period = 500
		  AddHandler mStateChangeTimer.Action, WeakAddressOf StateChangeTimerHandler
		  mStateChangeTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(UsePlayer As libvlc.VLCPlayer)
		  Me.Constructor()
		  Me.TruePlayer = UsePlayer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From VLCInstance
		  Super.Constructor()
		  mPlayer = FromPtr
		  If AddRef Then libvlc_media_list_player_retain(FromPtr)
		  mStateChangeTimer = New Timer
		  mStateChangeTimer.Period = 500
		  AddHandler mStateChangeTimer.Action, WeakAddressOf StateChangeTimerHandler
		  mStateChangeTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mPlayer <> Nil Then libvlc_media_list_player_release(mPlayer)
		  mPlayer = Nil
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
		Sub Insert(Index As Integer, Medium As libvlc.Medium)
		  PlayList.Insert(Index, Medium)
		  Playlist = Playlist
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Index As Integer) As libvlc.Medium
		  Return Playlist(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(Added() As FolderItem)
		  Playlist.Load(Added)
		  Playlist = Playlist
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(Added() As libvlc.Medium)
		  Playlist.Load(Added)
		  Playlist = Playlist
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadM3U(M3U As FolderItem) As Integer
		  Call Playlist.LoadM3U(M3U)
		  Playlist = Playlist
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadM3U(M3U As Readable) As Integer
		  Call Playlist.LoadM3U(M3U)
		  Playlist = Playlist
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
		Function Operator_Compare(OtherInstance As libvlc.ListPlayer) As Integer
		  Dim i As Integer = Super.Operator_Compare(OtherInstance)
		  If i = 0 Then i = Sign(Integer(mPlayer) - Integer(OtherInstance.mPlayer))
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  If mPlayer <> Nil Then libvlc_media_list_player_pause(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  If mPlayer <> Nil Then libvlc_media_list_player_play(mPlayer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Play(Index As Integer = - 1, StartPaused As Boolean = False) As Boolean
		  If Index = -1 Then
		    Me.Play()
		  Else
		    Me.Play(Index)
		  End If
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
		Sub Play(Index As Integer)
		  If mPlayer = Nil Then Return
		  If libvlc_media_list_player_play_item_at_index(mPlayer, Index) <> 0 Then
		    Raise New VLCException("The media list does not contain an entry at that index.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play(Media As libvlc.Medium)
		  If mPlayer <> Nil Then
		    Dim index As Integer = mPlayList.IndexOf(Media)
		    If index > -1 Then
		      If libvlc_media_list_player_play_item(mPlayer, Media.Handle) = 0 Then Return
		    End If
		    Raise New VLCException("That medium is not included in this media list.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PlayAsList(MediaFiles() As FolderItem, Optional TruePlayer As libvlc.VLCPlayer) As libvlc.ListPlayer
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaFiles)
		    m.Append(MediaFiles(i))
		  Next
		  Return PlayAsList(m, TruePlayer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PlayAsList(Media() As libvlc.Medium, Optional TruePlayer As libvlc.VLCPlayer) As libvlc.ListPlayer
		  Dim play As New ListPlayer
		  If TruePlayer <> Nil Then play.TruePlayer = TruePlayer
		  play.PlayList = Media
		  Return play
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function PlayAsList(MediaURLs() As String, Optional TruePlayer As libvlc.VLCPlayer) As libvlc.ListPlayer
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaURLs)
		    m.Append(MediaURLs(i))
		  Next
		  Return PlayAsList(m, TruePlayer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  PlayList.Remove(Index)
		  Playlist = Playlist
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StateChangeTimerHandler(Sender As Timer)
		  #pragma Unused Sender
		  If mPlayer <> Nil And (Me.CurrentState <> mLastState) Or Me.ListIndex <> mLastIndex Then
		    mLastState = Me.CurrentState
		    mLastIndex = Me.ListIndex
		    RaiseEvent ChangedState()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  If mPlayer <> Nil Then libvlc_media_list_player_stop(mPlayer)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ChangedState()
	#tag EndHook


	#tag Note, Name = About this class
		This class plays a PlayList object containing one or more Medium objects
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return ListIndex < ListCount - 1
			End Get
		#tag EndGetter
		CanMoveNext As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.ListIndex > 0
			End Get
		#tag EndGetter
		CanMovePrev As Boolean
	#tag EndComputedProperty

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
			  If mPlayList = Nil Then Return -1
			  Return mPlayList.LengthMS
			End Get
		#tag EndGetter
		LengthMS As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayList <> Nil Then Return mPlaylist.Count
			End Get
		#tag EndGetter
		ListCount As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayList = Nil Then Return -1
			  return mPlayList.CurrentIndex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Play(value)
			End Set
		#tag EndSetter
		ListIndex As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLastIndex As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastState As libvlc.PlayerState
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

	#tag Property, Flags = &h21
		Private mStateChangeTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTruePlayer As libvlc.VLCPlayer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayList = Nil Then mPlayList = New libvlc.PlayList()
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayList = Nil Or ListIndex = -1 Then Return -1
			  Return mPlayList.TimeMS + TruePlayer.TimeMS
			End Get
		#tag EndGetter
		TimeMS As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer = Nil Then Return Nil
			  ' libvlc_media_list_player_get_media_player is documented, but is not always exported by the library
			  ' https://github.com/oaubert/python-vlc/issues/13
			  If System.IsFunctionAvailable("libvlc_media_list_player_get_media_player", VLCLib) Then
			    Dim p As Ptr = libvlc_media_list_player_get_media_player(mPlayer)
			    If p <> Nil Then Return New VLCPlayerPtr(p, True)
			  End If
			  Return mTruePlayer
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Replaces the current VLCPlayer. If there are no other references to the old VLCPlayer then
			  ' it is destroyed.
			  
			  If mPlayer = Nil Then Raise New NilObjectException
			  libvlc_media_list_player_set_media_player(mPlayer, value.Handle)
			  If Not System.IsFunctionAvailable("libvlc_media_list_player_get_media_player", VLCLib) Then
			    mTruePlayer = value
			  End If
			End Set
		#tag EndSetter
		TruePlayer As libvlc.VLCPlayer
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
			Name="CanMoveNext"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanMovePrev"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="ListCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListIndex"
			Group="Behavior"
			Type="Integer"
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
