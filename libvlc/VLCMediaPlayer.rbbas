#tag Class
Class VLCMediaPlayer
Inherits Canvas
	#tag CompatibilityFlags = TargetHasGUI
	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  ' This event is not raised
		  #pragma Unused obj
		  #pragma Unused action
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  ' This event is not raised
		  #pragma Unused obj
		  #pragma Unused action
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  ' This event is not raised
		  #pragma Unused obj
		  #pragma Unused action
		  #pragma Unused x
		  #pragma Unused y
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  ' This event is not raised
		  #pragma Unused Key
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  ' This event is not raised
		  #pragma Unused Key
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  Break
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  mPlayer = New VLCPlayer
		  AddHandler mPlayer.VLCLog, WeakAddressOf VLCLogHandler
		  AddHandler mPlayer.ChangedState, WeakAddressOf ChangedStateHandler
		  mPlayer.EmbedWithin(Me)
		  RaiseEvent Open()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ChangedStateHandler(Sender As libvlc.VLCPlayer)
		  #pragma Unused Sender
		  RaiseEvent ChangedState()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MetaData() As libvlc.Meta.MetaData
		  Return mPlayer.MetaData
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  mPlayer.Pause
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  mPlayer.Play
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  mPlayer.Stop
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TruePlayer() As libvlc.VLCPlayer
		  Return mPlayer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub VLCLogHandler(Sender As libvlc.VLCPlayer, Level As Integer, Context As Ptr, Format As String, Args As String)
		  #pragma Unused Sender
		  #pragma Unused Context
		  System.DebugLog("libvlc: severity: " + Str(Level) + " " + Format + " (" + Args + ")")
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ChangedState()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.CanPause
			End Get
		#tag EndGetter
		CanPause As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.CanPlay
			End Get
		#tag EndGetter
		CanPlay As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.CanSeek
			End Get
		#tag EndGetter
		CanSeek As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.CurrentState
			End Get
		#tag EndGetter
		CurrentState As libvlc.PlayerState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then return mPlayer.Equalizer
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.Equalizer = value
			End Set
		#tag EndSetter
		Equalizer As libvlc.Equalizer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.HasAudio
			End Get
		#tag EndGetter
		HasAudio As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.HasSubtitles
			End Get
		#tag EndGetter
		HasSubtitles As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.HasVideo
			End Get
		#tag EndGetter
		HasVideo As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.IsPlaying
			End Get
		#tag EndGetter
		IsPlaying As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.LengthMS
			End Get
		#tag EndGetter
		LengthMS As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.Media
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPlayer.Media = value
			End Set
		#tag EndSetter
		Media As libvlc.Medium
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mPlayer As libvlc.VLCPlayer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.Muted
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.Muted = value
			End Set
		#tag EndSetter
		Muted As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.Position
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.Position = value
			End Set
		#tag EndSetter
		Position As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then return mPlayer.Scale
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.Scale = value
			End Set
		#tag EndSetter
		Scale As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then return mPlayer.Speed
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.Speed = value
			End Set
		#tag EndSetter
		Speed As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.TimeMS
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.TimeMS = value
			End Set
		#tag EndSetter
		TimeMS As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.Volume
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.Volume = value
			End Set
		#tag EndSetter
		Volume As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
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
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
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
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
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
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
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
			Type="String"
			InheritedFrom="Canvas"
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
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Volume"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
