#tag Window
Begin Window DVDNavigator
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   6.6e+1
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
   Title           =   "Menu Control"
   Visible         =   True
   Width           =   1.05e+2
   Begin PushButton UpButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "▲"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   36
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   1
      Underline       =   ""
      Visible         =   True
      Width           =   35
   End
   Begin PushButton ActionButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   36
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
      Top             =   22
      Underline       =   ""
      Visible         =   True
      Width           =   35
   End
   Begin PushButton DownButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "▼"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   36
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   43
      Underline       =   ""
      Visible         =   True
      Width           =   35
   End
   Begin PushButton RightButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "▶"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   70
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   22
      Underline       =   ""
      Visible         =   True
      Width           =   35
   End
   Begin PushButton LeftButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "◀"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   22
      Underline       =   ""
      Visible         =   True
      Width           =   35
   End
   Begin PushButton CancelButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   -45
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   -67
      Underline       =   ""
      Visible         =   True
      Width           =   35
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Select Case Asc(Key)
		  Case &h1E ' up
		    UpButton.Push()
		    Return True
		  Case &h1F ' down
		    DownButton.Push()
		    Return True
		  Case &h1C 'left
		    LeftButton.Push()
		    Return True
		  Case &h1D ' right
		    RightButton.Push()
		    Return True
		  End Select
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(Player As libvlc.VLCPlayer)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  mPlayer = Player
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mPlayer As libvlc.VLCPlayer
	#tag EndProperty


#tag EndWindowCode

#tag Events UpButton
	#tag Event
		Sub Action()
		  If mPlayer <> Nil Then mPlayer.NavigateMenu(libvlc.NavigationMode.Up)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ActionButton
	#tag Event
		Sub Action()
		  If mPlayer <> Nil Then mPlayer.NavigateMenu(libvlc.NavigationMode.Activate)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DownButton
	#tag Event
		Sub Action()
		  If mPlayer <> Nil Then mPlayer.NavigateMenu(libvlc.NavigationMode.Down)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RightButton
	#tag Event
		Sub Action()
		  If mPlayer <> Nil Then mPlayer.NavigateMenu(libvlc.NavigationMode.Right)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LeftButton
	#tag Event
		Sub Action()
		  If mPlayer <> Nil Then mPlayer.NavigateMenu(libvlc.NavigationMode.Left)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelButton
	#tag Event
		Sub Action()
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
