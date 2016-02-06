#tag Window
Begin ContainerControl VLCPlayerContainer
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   117
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   3.2e+1
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   3.2e+1
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   132
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Player = New VLCPlayer
		  Player.EmbedWithin(Self)
		  RaiseEvent Open()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LoadMedia(Media As FolderItem)
		  Player.MediaFile = Media
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadMedia(URL As String)
		  Player.MediaURL = URL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  Player.Pause
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Play()
		  Player.Play
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  Player.Stop
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h1
		Protected Player As VLCPlayer
	#tag EndProperty


#tag EndWindowCode

