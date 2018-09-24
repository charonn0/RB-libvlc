#tag Window
Begin Window FullscreenParent
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   8.7e+1
   ImplicitInstance=   True
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
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   2.22e+2
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Untitled"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   71
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -56
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Timer SetPositionTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   245
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   0
      Width           =   32
   End
   Begin Timer SetPositionTimer1
      Height          =   32
      Index           =   -2147483648
      Left            =   245
      LockedInPosition=   False
      Mode            =   2
      Period          =   150
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   35
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  If mControls <> Nil Then mControls.Close
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If mControls <> Nil Then mControls.Display
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.FullScreen = True
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ShowPlayer(Player As libvlc.VLCMediaPlayer) As Single
		  Me.ShowPlayer(Player.TruePlayer)
		  mStartTime = Player.TimeMS
		  Dim p As Int64 = Player.LengthMS
		  If Not mPlayer.Stop Then Break
		  mPlayer.EmbedWithin(Player)
		  mPlayer.Play
		  Do
		    App.YieldToNextThread
		  Loop Until mPlayer.CurrentState <> libvlc.PlayerState.OPENING
		  Return (mStartTime * 100 / p) / 100
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowPlayer(Player As libvlc.VLCPlayer)
		  mPlayer = Player
		  Self.Title = mPlayer.MetaData.Lookup(libvlc.MetaDataType.Title, "Fullscreen video")
		  mStartTime = mPlayer.TimeMS
		  If Not mPlayer.Stop Then Break
		  mPlayer.EmbedWithin(Self)
		  Do Until mPlayer.Play
		    App.YieldToNextThread
		  Loop Until mPlayer.CurrentState = libvlc.PlayerState.ERROR
		  SetPositionTimer.Mode = Timer.ModeSingle
		  Me.ShowModal
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mControls As FullscreenControls
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlayer As libvlc.VLCPlayer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartTime As Int64
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SetPositionTimer
	#tag Event
		Sub Action()
		  If mPlayer.CurrentState <> libvlc.PlayerState.PLAYING Then
		    Me.Reset
		  Else
		    mPlayer.Position = (mStartTime * 100 / mPlayer.LengthMS) / 100
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SetPositionTimer1
	#tag Event
		Sub Action()
		  If mPlayer = Nil Then Return
		  If mPlayer.CurrentState = libvlc.PlayerState.ENDED Or _
		    mPlayer.CurrentState = libvlc.PlayerState.ERROR Or mPlayer.CurrentState = libvlc.PlayerState.STOPPING Then Self.Close
		    If mControls = Nil Then
		      mControls = New FullscreenControls
		      mControls.ShowPlayer(mPlayer, Self)
		      mControls.Display
		    End If
		End Sub
	#tag EndEvent
#tag EndEvents
