#tag Window
Begin Window FullscreenControls
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   6.4e+1
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   6.06e+2
   Begin Slider VolControl
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   412
      LineStep        =   10
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Maximum         =   125
      Minimum         =   0
      PageStep        =   25
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   28
      Value           =   100
      Visible         =   True
      Width           =   188
   End
   Begin PushButton StopButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Stop"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   305
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   28
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Slider Slider1
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   103
      LineStep        =   100
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   10000
      Minimum         =   0
      PageStep        =   100
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   6
      Value           =   0
      Visible         =   True
      Width           =   497
   End
   Begin PushButton PlayButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Pause"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   221
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   28
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label TimeLabel
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "00:00:00/00:00:00"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   6
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   91
   End
   Begin Timer PlayerTimer
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   624
      LockedInPosition=   False
      Mode            =   2
      Period          =   250
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -11
      Visible         =   True
      Width           =   32
   End
   Begin Timer VisibleTimer
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      Left            =   624
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   28
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub MouseEnter()
		  VisibleTimer.Period = 3000
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  VisibleTimer.Period = 1000
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  VisibleTimer.Reset
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  #If TargetWin32 Then
		    Declare Function SetWindowLongW Lib "User32" (HWND As Integer, Index As Integer, NewLong As Integer) As Integer
		    Const GWL_STYLE = -16
		    Const WS_POPUP = &h80000000
		    'Const WS_EX_TOOLWINDOW = &h00000080
		    'Const WS_EX_WINDOWEDGE = &h00000100
		    'Const WS_EX_TOPMOST = &h00000008
		    'Dim WS_EX_PALETTEWINDOW As Integer = WS_EX_WINDOWEDGE Or WS_EX_TOOLWINDOW Or WS_EX_TOPMOST
		    Call SetWindowLongW(Me.Handle, GWL_STYLE, WS_POPUP)
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Display()
		  Me.Visible = True
		  VisibleTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowPlayer(Player As libvlc.VLCPlayer, Parent As FullscreenParent)
		  Dim X, Y As Integer
		  Me.Player = Player
		  Dim pt As New REALbasic.Point(Parent.Top + 1, Parent.Left + 1)
		  Dim c As Integer = ScreenCount
		  For i As Integer = 0 To c - 1
		    Dim rect As New REALbasic.Rect(Screen(i).Left, Screen(i).Top, Screen(i).Width, Screen(i).Height)
		    If rect.Contains(pt) Then
		      X = (0.5 * Screen(i).Width) - (0.5 * Self.Width)
		      Y = Screen(i).Height - Self.Height
		      Me.Show
		      If Screen(i).Top > Screen(0).Height - 1 Then
		        Y = Y + Screen(i).Height
		      End If
		      If Screen(i).Left > Screen(0).Width - 1 Then
		        X = X + Screen(i).Width
		      End If
		      Self.Left = X
		      Self.Top = Y
		      Return
		    End If
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLock As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Player As VLCPlayer
	#tag EndProperty


#tag EndWindowCode

#tag Events VolControl
	#tag Event
		Sub ValueChanged()
		  If Not mLock Then Player.Volume = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  Player.Stop
		  'Self.Title = "'" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, Player.Media.URL) + "'"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  If Not mLock Then
		    Player.Position = (Me.Value * 100 / Me.Maximum) / 100
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayButton
	#tag Event
		Sub Action()
		  If Me.Caption = "Play" Then
		    If Player.CurrentState = libvlc.PlayerState.ENDED Then Player.Stop()
		    Player.Play
		    Me.Caption = "Pause"
		  Else
		    Player.Pause
		    Me.Caption = "Play"
		  End If
		  PlayerTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayerTimer
	#tag Event
		Sub Action()
		  If Player = Nil Then Return
		  If Player.Media = Nil Then
		    PlayButton.Enabled = False
		    StopButton.Enabled = False
		    Slider1.Enabled = False
		    VolControl.Enabled = False
		  Else
		    mLock = True
		    Try
		      Slider1.Value = (Player.TimeMS * 100 / Player.LengthMS) * 100
		      VolControl.Value = Player.Volume
		    Finally
		      mLock = False
		    End Try
		    TimeLabel.Text = libvlc.FormatTime(Player.TimeMS) + "/" + libvlc.FormatTime(Player.LengthMS)
		    PlayButton.Enabled = True
		    StopButton.Enabled = True
		    Slider1.Enabled = True
		    VolControl.Enabled = True
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VisibleTimer
	#tag Event
		Sub Action()
		  Self.Visible = False
		End Sub
	#tag EndEvent
#tag EndEvents
