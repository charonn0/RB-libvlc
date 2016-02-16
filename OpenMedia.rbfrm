#tag Window
Begin Window OpenMedia
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   9.1e+1
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "Open media"
   Visible         =   True
   Width           =   4.36e+2
   Begin TextField MediaURL
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   20
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   29
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   264
   End
   Begin PushButton GetFile
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Use File"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   296
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   29
      Underline       =   ""
      Visible         =   True
      Width           =   60
   End
   Begin PushButton Browser1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Use Disc"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   356
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   29
      Underline       =   ""
      Visible         =   True
      Width           =   60
   End
   Begin Label Label1
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
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   "Media URL:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   8
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   362
   End
   Begin PushButton OKBtn
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
      Left            =   221
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
      Top             =   63
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton CancelBtn
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
      Left            =   135
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
      Top             =   63
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function Load(Optional InitialValue As libvlc.VLCMedium) As libvlc.VLCMedium
		  mMedium = InitialValue
		  If mMedium <> Nil Then MediaURL.Text = mMedium.URL
		  Me.ShowModal
		  Return mMedium
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mMedium As libvlc.VLCMedium
	#tag EndProperty


#tag EndWindowCode

#tag Events MediaURL
	#tag Event
		Sub TextChange()
		  mMedium = Me.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GetFile
	#tag Event
		Sub Action()
		  Dim f As FolderItem
		  If Left(MediaURL.Text, 5) = "file:" Then f = GetFolderItem(MediaURL.Text, FolderItem.PathTypeURL)
		  If mMedium <> Nil Then f = mMedium.MediaFile
		  Dim dlg As New OpenDialog
		  dlg.ActionButtonCaption = "Open media"
		  dlg.Filter = MediaFileTypes.All
		  If f <> Nil Then
		    If f.Directory Then dlg.InitialDirectory = f Else dlg.InitialDirectory = f.Parent
		  End If
		  f = dlg.ShowModal()
		  If f <> Nil Then MediaURL.Text = f.URLPath
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Browser1
	#tag Event
		Sub Action()
		  Dim f As FolderItem
		  If Left(MediaURL.Text, 5) = "file:" Then f = GetFolderItem(MediaURL.Text, FolderItem.PathTypeURL)
		  If mMedium <> Nil Then f = mMedium.MediaFile
		  Dim dlg As New SelectFolderDialog
		  dlg.ActionButtonCaption = "Open media"
		  If f <> Nil Then
		    If f.Directory Then dlg.InitialDirectory = f Else dlg.InitialDirectory = f.Parent
		  End If
		  f = dlg.ShowModal()
		  If f <> Nil Then
		    MediaURL.Text = f.URLPath
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OKBtn
	#tag Event
		Sub Action()
		  mMedium = MediaURL.Text
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelBtn
	#tag Event
		Sub Action()
		  mMedium = Nil
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
