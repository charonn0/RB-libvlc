#tag Window
Begin Window OpenMedia
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   91
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
   Width           =   6.0e+2
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
      TabIndex        =   1
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
      Width           =   428
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
      Left            =   460
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
      Left            =   520
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
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
      TabIndex        =   0
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
      Left            =   314
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   62
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
      Left            =   228
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   62
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
      CueText         =   ":sout=#transcode{acodec=mp3,ab=128,channels=2,samplerate=44100}:std{access=file,mux=raw,dst=music.mp3}"
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
      TabIndex        =   5
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
      Width           =   494
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
      TabIndex        =   4
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   66
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
      Left            =   468
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
      Top             =   -60
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   80
   End
   Begin DisclosureTriangle MoreSpaceDTriangle
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Facing          =   0
      Height          =   18
      HelpTag         =   "More space"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   581
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   64
      Value           =   False
      Visible         =   False
      Width           =   18
   End
   Begin TextArea OptionsText
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   69
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   80
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   8
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
      Width           =   500
   End
   Begin AdvancedOptionsEditor OptionsEditor
      BackColor       =   &hFFFFFF
      Backdrop        =   ""
      CloseButton     =   True
      Composite       =   False
      Frame           =   0
      FullScreen      =   False
      HasBackColor    =   False
      Height          =   185
      ImplicitInstance=   True
      InitialParent   =   ""
      LiveResize      =   True
      LockedInPosition=   False
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
      Scope           =   0
      TabPanelIndex   =   0
      Title           =   "Untitled"
      Visible         =   False
      Width           =   500
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  OptionsEditor.Left = -1500
		  OptionsEditor.Visible = False
		End Sub
	#tag EndEvent


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
		  Dim args() As String = libvlc.SplitQuoted(OptionsText.Text.Trim)
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
#tag Events MediaOpts
	#tag Event
		Sub TextChange()
		  OptionsText.Text = Me.Text
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
		    MoreSpaceDTriangle.Visible = True
		    Me.HelpTag = "Hide options"
		  Else
		    If MoreSpaceDTriangle.Value Then MoreSpaceDTriangle.Value = False
		    Self.Height = 91
		    Label2.Visible = False
		    MediaOpts.Visible = False
		    MoreSpaceDTriangle.Visible = False
		    Me.HelpTag = "Show options"
		    OptionsEditor.Top = -100000
		    OptionsEditor.Visible = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MoreSpaceDTriangle
	#tag Event
		Sub Action()
		  If Me.Value Then
		    Self.Height = 347
		    MediaOpts.Visible = False
		    OptionsText.Visible = True
		    Me.HelpTag = "Less space"
		    OptionsEditor.Left = 80
		    OptionsEditor.Top = 131
		    OptionsEditor.Visible = True
		  Else
		    Self.Height = 121
		    MediaOpts.Visible = True
		    OptionsText.Visible = False
		    Me.HelpTag = "More space"
		    OptionsEditor.Top = -100000
		    OptionsEditor.Visible = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OptionsEditor
	#tag Event
		Sub OptionsChanged(NewOptions As libvlc.TranscodeOptions)
		  MediaOpts.Text = NewOptions.ToString()
		End Sub
	#tag EndEvent
#tag EndEvents
