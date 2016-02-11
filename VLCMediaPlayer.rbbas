#tag Class
Protected Class VLCMediaPlayer
Inherits Canvas
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
		Sub DropObject(obj As DragItem, action As Integer)
		  ' This event is not raised
		  #pragma Unused obj
		  #pragma Unused action
		End Sub
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
		  mPlayer.EmbedWithin(Me)
		  RaiseEvent Open()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function MetaData() As libvlc.MetaData
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


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.CaptureKeyboard
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.CaptureKeyboard = value
			End Set
		#tag EndSetter
		CaptureKeyboard As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.CaptureMouse
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.CaptureMouse = value
			End Set
		#tag EndSetter
		CaptureMouse As Boolean
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
			  If mPlayer <> Nil Then Return mPlayer.Fullscreen
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer = Nil Then Return
			  
			  If value Then
			    If TruePlayer.Fullscreen Then Return
			    Dim w As New FullscreenParent
			    Dim b As Boolean = IsPlaying
			    Dim pos As Single = Position
			    If b Then Stop
			    TruePlayer.EmbedWithin(w)
			    TruePlayer.Fullscreen = True
			    If b Then 
			      Position = pos
			      Play
			    End If
			    w.ShowModal
			    b = IsPlaying
			    pos = Position
			    If b Then Stop
			    TruePlayer.EmbedWithin(Me)
			    If b Then 
			      Position = pos
			      Play
			    End If
			  Else
			    TruePlayer.Fullscreen = False
			    If Not TruePlayer.EmbeddedWithin = Me.Handle Then
			      TruePlayer.EmbedWithin(Me)
			    End If
			  End If
			End Set
		#tag EndSetter
		Fullscreen As Boolean
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
		Media As libvlc.VLCMedium
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
			  If mPlayer <> Nil Then Return mPlayer.TimeMS
			End Get
		#tag EndGetter
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
			Name="Fullscreen"
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
