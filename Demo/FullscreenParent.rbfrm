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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.FullScreen = True
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ShowPlayer(Player As libvlc.VLCMediaPlayer)
		  Me.ShowPlayer(Player.TruePlayer)
		  Dim time As Int64 = Player.TimeMS
		  Player.Stop
		  Player.TruePlayer.EmbedWithin(Player)
		  Player.TruePlayer.Play
		  Do
		    App.YieldToNextThread
		  Loop Until Player.TruePlayer.CurrentState <> libvlc.PlayerState.OPENING
		  Player.TruePlayer.Position = (Player.LengthMS * 100 / time) / 100
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowPlayer(Player As libvlc.VLCPlayer)
		  Dim time As Int64 = Player.TimeMS
		  Player.Stop
		  Player.EmbedWithin(0)
		  Player.EmbedWithin(Self)
		  Player.Play
		  Do
		    App.YieldToNextThread
		  Loop Until Player.CurrentState <> libvlc.PlayerState.OPENING
		  Player.Position = (Player.LengthMS * 100 / time) / 100
		  Me.ShowModal
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
