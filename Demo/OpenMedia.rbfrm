#tag Window
Begin Window OpenMedia
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   8.3e+1
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   54
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   54
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin TextField MediaOpts
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
      Left            =   80
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   59
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   False
      Width           =   249
   End
   Begin Label Label2
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
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "Options:"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   60
      Transparent     =   False
      Underline       =   ""
      Visible         =   False
      Width           =   57
   End
   Begin DisclosureTriangle DisclosureTriangle1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Facing          =   0
      Height          =   18
      HelpTag         =   "Show options"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   14
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   58
      Value           =   False
      Visible         =   True
      Width           =   18
   End
   Begin CheckBox UseMemory
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "imem://"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "When enabled, the demo will load media using callbacks instead of giving the URL/Path of the file. "
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   336
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   60
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function Load(Optional InitialValue As libvlc.Medium) As libvlc.Medium
		  mMedium = InitialValue
		  If mMedium <> Nil Then MediaURL.Text = mMedium.MediaURL
		  Me.ShowModal
		  Return mMedium
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mMedium As libvlc.Medium
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
		  If UseMemory.Value Then
		    Dim bs As BinaryStream = BinaryStream.Open(GetFolderItem(MediaURL.Text, FolderItem.PathTypeURL))
		    mMedium = New libvlc.Medium(bs)
		  Else
		    mMedium = MediaURL.Text
		  End If
		  Dim args() As String = SplitQuoted(MediaOpts.Text.Trim)
		  For i As Integer = 0 To UBound(args)
		    mMedium.AddOption(args(i))
		  Next
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
#tag Events DisclosureTriangle1
	#tag Event
		Sub Action()
		  If Me.Value Then
		    Self.Height = 121
		    Label2.Visible = True
		    MediaOpts.Visible = True
		    Me.HelpTag = "Hide options"
		  Else
		    Self.Height = 91
		    Label2.Visible = False
		    MediaOpts.Visible = False
		    Me.HelpTag = "Show options"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
