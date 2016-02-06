#tag Window
Begin Window Window1
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   531314687
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Player = New libvlc.VLCPlayer(GetOpenFolderItem(""))
		  If Player <> Nil Then
		    Player.EmbedWithin(Self)
		    Call Player.Play()
		  Else
		    Break
		  End If
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Player As libvlc.VLCPlayer
	#tag EndProperty


#tag EndWindowCode

