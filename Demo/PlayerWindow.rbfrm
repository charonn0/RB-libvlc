#tag Window
Begin Window PlayerWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   5.71e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   571
   MinimizeButton  =   True
   MinWidth        =   756
   Placement       =   2
   Resizeable      =   True
   Title           =   "*"
   Visible         =   True
   Width           =   7.56e+2
   Begin Timer PlayerTimer
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   767
      LockedInPosition=   False
      Mode            =   2
      Period          =   20
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   272
      Width           =   32
   End
   Begin Timer FullscreenRevertTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   767
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   207
      Width           =   32
   End
   Begin UpDownArrows ScaleChange
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   649
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   341
      Visible         =   True
      Width           =   13
   End
   Begin Label ScaleLabel
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
      Left            =   592
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      Text            =   "Scale: 1.0"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   343
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   57
   End
   Begin Label SpeedLabel
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
      Left            =   505
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      Text            =   "Speed: 1.0"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   343
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   68
   End
   Begin UpDownArrows SpeedChange
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   573
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   341
      Visible         =   True
      Width           =   13
   End
   Begin PushButton FullscreenBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Full Screen"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   346
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   344
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
      Left            =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   27
      TabPanelIndex   =   0
      Text            =   "00:00:00/00:00:00"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   316
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   92
   End
   Begin Label Label4
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
      Left            =   184
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   26
      TabPanelIndex   =   0
      Text            =   "Audio track:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   370
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin ComboBox AudioTracks
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   268
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   369
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   112
   End
   Begin ComboBox VideoTracks
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   464
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   370
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   112
   End
   Begin Label Label3
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
      Left            =   384
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      Text            =   "Video track:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   371
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   76
   End
   Begin CheckBox IsMuted
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Muted"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   672
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   343
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   75
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Metadata"
      Enabled         =   True
      Height          =   151
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   9
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   400
      Underline       =   ""
      Visible         =   True
      Width           =   725
      Begin Listbox MetaDataList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   True
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         Enabled         =   True
         EnableDrag      =   ""
         EnableDragReorder=   ""
         GridLinesHorizontal=   0
         GridLinesVertical=   0
         HasHeading      =   True
         HeadingIndex    =   -1
         Height          =   125
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   "Key	Value"
         Italic          =   ""
         Left            =   18
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   418
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   706
         _ScrollWidth    =   -1
      End
   End
   Begin PushButton LoadBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Load"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   9
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   344
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin ComboBox SubtitleTracks
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   68
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   370
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   112
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
      Left            =   9
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      Text            =   "Subtitle:"
      TextAlign       =   2
      TextColor       =   &h000000FF
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   370
      Transparent     =   False
      Underline       =   True
      Visible         =   True
      Width           =   55
   End
   Begin PushButton PlayButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Play"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   176
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   344
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
      Left            =   107
      LineStep        =   100
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   10000
      Minimum         =   0
      PageStep        =   100
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   316
      Value           =   0
      Visible         =   True
      Width           =   523
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
      Left            =   260
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   344
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Slider VolControl
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   636
      LineStep        =   10
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Maximum         =   125
      Minimum         =   0
      PageStep        =   25
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   316
      Value           =   100
      Visible         =   True
      Width           =   111
   End
   Begin Rectangle Rectangle1
      AutoDeactivate  =   True
      BorderWidth     =   1
      BottomRightColor=   &h000000
      Enabled         =   True
      FillColor       =   &h00000000
      Height          =   314
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   33
      TabPanelIndex   =   0
      Top             =   0
      TopLeftColor    =   &h000000
      Visible         =   True
      Width           =   755
      Begin libvlc.VLCMediaPlayer Player
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   320178175
         CanPause        =   ""
         CanPlay         =   ""
         CanSeek         =   ""
         CaptureMouse    =   ""
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   False
         HasAudio        =   ""
         HasSubtitles    =   ""
         HasVideo        =   ""
         Height          =   314
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         IsPlaying       =   ""
         Left            =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Muted           =   False
         Position        =   0.0
         Scale           =   ""
         Scope           =   0
         Speed           =   ""
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   0
         UseFocusRing    =   True
         Visible         =   True
         Volume          =   100
         Width           =   755
      End
   End
   Begin Timer TimeTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   767
      LockedInPosition=   False
      Mode            =   2
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   239
      Width           =   32
   End
   Begin ComboBox AspectRatio
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "Default\r\n1:1\r\n4:3\r\n16:9\r\n5:4\r\n1.85\r\n2.35"
      Italic          =   ""
      Left            =   670
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   369
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   75
   End
   Begin Label Label5
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
      Left            =   580
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   36
      TabPanelIndex   =   0
      Text            =   "Aspect ratio:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   370
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton LoadBtn1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Load playlist"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   93
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   37
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   344
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  PlayerTimer.Mode = Timer.ModeOff
		  If mPlaylistWindow <> Nil Then mPlaylistWindow.Close
		  mPlaylistWindow = Nil
		End Sub
	#tag EndEvent

	#tag Event
		Sub Moved()
		  If mPlaylistWindow <> Nil Then
		    mPlaylistWindow.Left = Self.Left + Self.Width
		    mPlaylistWindow.Top = Self.Top
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  If mPlaylistWindow <> Nil Then
		    mPlaylistWindow.Left = Self.Left + Self.Width
		    mPlaylistWindow.Top = Self.Top
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub LoadMedia(Media As libvlc.Medium)
		  If Media = Nil Then Return
		  Player.Media = Media
		  ReadMetaData(Media)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadPlaylist(Items() As FolderItem)
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(Items)
		    Dim mediafile As FolderItem = Items(i)
		    If mediafile.Directory Then ' load chilren
		      For j As Integer = 1 To mediafile.Count - 1
		        Dim f As FolderItem = mediafile.Item(i)
		        If Not f.Directory Then m.Append(f)
		      Next
		    Else
		      m.Append(mediafile)
		    End If
		  Next
		  
		  If mPlaylistWindow = Nil Then
		    mPlaylistWindow = New PlayListWindow
		  End If
		  mPlaylistWindow.ShowList(Self, Player.TruePlayer, m)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NotifyListClosed(Sender As PlayListWindow)
		  If Sender Is mPlaylistWindow Then mPlaylistWindow = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ReadMetaData(Media As libvlc.Medium)
		  If Media = Nil Then Return
		  mArtwork = Media.Artwork
		  MetaDataList.DeleteAllRows
		  MetaDataList.AddRow("Actors", Media.Actors)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Actors
		  MetaDataList.AddRow("Album", Media.Album)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Album
		  MetaDataList.AddRow("Album Artist", Media.AlbumArtist)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.AlbumArtist
		  MetaDataList.AddRow("Artist", Media.Artist)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Artist
		  MetaDataList.AddRow("Artwork URL", Media.ArtworkURL)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.ArtworkURL
		  MetaDataList.AddRow("Copyright", Media.Copyright)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Copyright
		  MetaDataList.AddRow("Date", Media.Date)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Date
		  MetaDataList.AddRow("Description", Media.Description)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Description
		  MetaDataList.AddRow("Director", Media.Director)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Director
		  MetaDataList.AddRow("Disc Number", Media.DiscNumber)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.DiscNumber
		  MetaDataList.AddRow("Disc Total", Media.DiscTotal)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.DiscTotal
		  MetaDataList.AddRow("Encoded By", Media.EncodedBy)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.EncodedBy
		  MetaDataList.AddRow("Episode", Media.Episode)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Episode
		  MetaDataList.AddRow("Genre", Media.Genre)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Genre
		  MetaDataList.AddRow("Language", Media.Language)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Language
		  MetaDataList.AddRow("Publisher", Media.Publisher)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Publisher
		  MetaDataList.AddRow("Rating", Media.Rating)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Rating
		  MetaDataList.AddRow("Season", Media.Season)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Season
		  MetaDataList.AddRow("Setting", Media.Setting)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Setting
		  MetaDataList.AddRow("Show Name", Media.ShowName)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.ShowName
		  MetaDataList.AddRow("Title", Media.Title)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.Title
		  MetaDataList.AddRow("TrackID", Media.TrackID)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.TrackID
		  MetaDataList.AddRow("TrackNumber", Media.TrackNumber)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.TrackNumber
		  MetaDataList.AddRow("TrackTotal", Media.TrackTotal)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.TrackTotal
		  MetaDataList.AddRow("URL", Media.URL)
		  MetaDataList.RowTag(MetaDataList.LastIndex) = libvlc.MetaDataType.URL
		  Player.Invalidate(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateUI()
		  Try
		    Dim c As Integer = Player.TruePlayer.SubtitleCount
		    SubtitleTracks.DeleteAllRows
		    If c > 0 Then
		      For i As Integer = 0 To c - 1
		        Dim ID As Integer = Player.TruePlayer.Subtitles.ID(i)
		        SubtitleTracks.AddRow(Player.TruePlayer.Subtitles.Name(i))
		        SubtitleTracks.RowTag(SubtitleTracks.ListCount - 1) = Player.TruePlayer.Subtitles.ID(i)
		        If ID = Player.TruePlayer.SubtitleIndex Then SubtitleTracks.ListIndex = SubtitleTracks.ListCount - 1
		      Next
		      SubtitleTracks.Enabled = True
		    Else
		      SubtitleTracks.Enabled = False
		    End If
		    
		    c = Player.TruePlayer.VideoTrackCount
		    VideoTracks.DeleteAllRows
		    If c > 0 Then
		      For i As Integer = 0 To c - 1
		        Dim ID As Integer = Player.TruePlayer.VideoTrackID(i)
		        VideoTracks.AddRow(Player.TruePlayer.VideoTrackDescription(i))
		        VideoTracks.RowTag(VideoTracks.ListCount - 1) = ID
		        If ID = Player.TruePlayer.VideoTrack Then VideoTracks.ListIndex = VideoTracks.ListCount - 1
		      Next
		      VideoTracks.Enabled = True
		    Else
		      VideoTracks.Enabled = False
		    End If
		    
		    c = Player.TruePlayer.AudioTrackCount
		    AudioTracks.DeleteAllRows
		    If c > 0 Then
		      For i As Integer = 0 To c - 1
		        Dim ID As Integer = Player.TruePlayer.AudioTrackID(i)
		        AudioTracks.AddRow(Player.TruePlayer.AudioTrackDescription(i))
		        AudioTracks.RowTag(AudioTracks.ListCount - 1) = ID
		        If ID = Player.TruePlayer.AudioTrack Then AudioTracks.ListIndex = AudioTracks.ListCount - 1
		      Next
		      AudioTracks.Enabled = True
		    Else
		      AudioTracks.Enabled = False
		    End If
		  Finally
		    mLock = False
		  End Try
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mArtwork As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFractionalSeconds As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastAspectRatio As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastItem As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastPosition As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLock As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlaylistWindow As PlayListWindow
	#tag EndProperty


#tag EndWindowCode

#tag Events PlayerTimer
	#tag Event
		Sub Action()
		  If Player = Nil Then Return
		  If Player.Media = Nil Then
		    PlayButton.Enabled = False
		    StopButton.Enabled = False
		    FullscreenBtn.Enabled = False
		    Slider1.Enabled = False
		    VolControl.Enabled = False
		  Else
		    mLock = True
		    Try
		      Slider1.Value = (Player.TimeMS * 100 / Player.LengthMS) * 100
		      VolControl.Value = Player.Volume
		      Dim ar As String = Player.TruePlayer.AspectRatio
		      If ar <> "" And ar <> AspectRatio.Text Then AspectRatio.Text = ar
		    Finally
		      mLock = False
		    End Try
		    Dim t As String
		    If mPlaylistWindow <> Nil Then
		      t = mPlaylistWindow.NotifyStateChanged()
		      If t = "!INVALID" Then t = "libvlc Demo"
		      If t = "" Then t = mLastItem
		      If t <> mLastItem Then
		        ReadMetaData(mPlaylistWindow.CurrentMedium)
		        mLastItem = t
		      End If
		      t = "'" + t + "'" + "(" + libvlc.PlayerStateName(Player.CurrentState) + ")"
		      
		    ElseIf Player.MetaData <> Nil Then
		      t = "'" + Player.TruePlayer.MetaData.Lookup(libvlc.MetaDataType.Title, Player.Media.MediaURL) + "'" + _
		      "(" + libvlc.PlayerStateName(Player.CurrentState) + ")"
		    Else
		      t = "libvlc demo"
		    End If
		    Self.Title = t
		    'TimeLabel.Text = libvlc.FormatTime(Player.TimeMS) + "/" + libvlc.FormatTime(Player.LengthMS)
		    ScaleLabel.Text = "Scale: " + Format(Player.TruePlayer.Scale, "##0.0##")
		    PlayButton.Enabled = True
		    StopButton.Enabled = True
		    FullscreenBtn.Enabled = True
		    Slider1.Enabled = True
		    VolControl.Enabled = True
		    FullscreenBtn.Enabled = Player.HasVideo
		    AspectRatio.Enabled = Player.HasVideo
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FullscreenRevertTimer
	#tag Event
		Sub Action()
		  If Player.CurrentState <> libvlc.PlayerState.PLAYING Then
		    Me.Reset
		  Else
		    Player.Position = mLastPosition
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScaleChange
	#tag Event
		Sub Down()
		  Dim scale As Single = Player.Scale
		  scale = scale - 0.1
		  If scale < 0.0001 Then scale = 0.0
		  Player.Scale = scale
		  ScaleLabel.Text = "Scale: " + Format(Player.Scale, "##0.0##")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Up()
		  Player.Scale = Player.Scale + 0.1
		  ScaleLabel.Text = "Scale: " + Format(Player.Scale, "##0.0##")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SpeedChange
	#tag Event
		Sub Up()
		  Player.Speed = Player.Speed + 0.1
		  SpeedLabel.Text = "Speed: " + Format(Player.Speed, "##0.0##")
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  Dim Speed As Single = Player.Speed
		  Speed = Speed - 0.1
		  If Speed < 0.0001 Then Speed = 0.0
		  Player.Speed = Speed
		  SpeedLabel.Text = "Speed: " + Format(Player.Speed, "##0.0##")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FullscreenBtn
	#tag Event
		Sub Action()
		  mLastPosition = FullscreenParent.ShowPlayer(Player)
		  FullscreenRevertTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimeLabel
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Dim r As New REALbasic.Rect(0, 0, Me.Width, Me.Height)
		  Dim p As New REALbasic.Point(X, Y)
		  If r.Contains(p) Then
		    mFractionalSeconds = Not mFractionalSeconds
		    Self.Refresh(False)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AudioTracks
	#tag Event
		Sub Change()
		  If Me.RowTag(Me.ListIndex) <> Nil And Not mLock Then
		    Try
		      Player.TruePlayer.AudioTrack = Me.RowTag(Me.ListIndex).Int32Value
		    Catch err As libvlc.VLCException
		      MsgBox(err.Message)
		    End Try
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VideoTracks
	#tag Event
		Sub Change()
		  If Me.RowTag(Me.ListIndex) <> Nil And Not mLock Then
		    Try
		      Player.TruePlayer.VideoTrack = Me.RowTag(Me.ListIndex).Int32Value
		    Catch err As libvlc.VLCException
		      MsgBox(err.Message)
		    End Try
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IsMuted
	#tag Event
		Sub Action()
		  Player.TruePlayer.Muted = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MetaDataList
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If Me.Cell(row, column) = "" And Not Me.Selected(row) Then
		    g.ForeColor = &c80808000
		    g.Italic = True
		    g.DrawString("Not set", x, y)
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  If column = 1 Then
		    Me.EditCell(row, column)
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Dim newvalue As String = Me.Cell(row, column).Trim
		  If newvalue <> "" Then
		    Dim type As libvlc.MetaDataType = Me.RowTag(row)
		    Select Case type
		    Case libvlc.MetaDataType.Actors
		      Player.Media.Actors = newvalue
		    Case libvlc.MetaDataType.Album
		      Player.Media.Album = newvalue
		    Case libvlc.MetaDataType.AlbumArtist
		      Player.Media.AlbumArtist = newvalue
		    Case libvlc.MetaDataType.Artist
		      Player.Media.Artist = newvalue
		    Case libvlc.MetaDataType.ArtworkURL
		      Player.Media.ArtworkURL = newvalue
		    Case libvlc.MetaDataType.Copyright
		      Player.Media.Copyright = newvalue
		    Case libvlc.MetaDataType.Date
		      Player.Media.Date = newvalue
		    Case libvlc.MetaDataType.Description
		      Player.Media.Description = newvalue
		    Case libvlc.MetaDataType.Director
		      Player.Media.Director = newvalue
		    Case libvlc.MetaDataType.DiscNumber
		      Player.Media.DiscNumber = newvalue
		    Case libvlc.MetaDataType.DiscTotal
		      Player.Media.DiscTotal = newvalue
		    Case libvlc.MetaDataType.EncodedBy
		      Player.Media.EncodedBy = newvalue
		    Case libvlc.MetaDataType.Episode
		      Player.Media.Episode = newvalue
		    Case libvlc.MetaDataType.Genre
		      Player.Media.Genre = newvalue
		    Case libvlc.MetaDataType.Language
		      Player.Media.Language = newvalue
		    Case libvlc.MetaDataType.Publisher
		      Player.Media.Publisher = newvalue
		    Case libvlc.MetaDataType.Rating
		      Player.Media.Rating = newvalue
		    Case libvlc.MetaDataType.Season
		      Player.Media.Season = newvalue
		    Case libvlc.MetaDataType.Setting
		      Player.Media.Setting = newvalue
		    Case libvlc.MetaDataType.ShowName
		      Player.Media.ShowName = newvalue
		    Case libvlc.MetaDataType.Title
		      Player.Media.Title = newvalue
		    Case libvlc.MetaDataType.TrackID
		      Player.Media.TrackID = newvalue
		    Case libvlc.MetaDataType.TrackNumber
		      Player.Media.TrackNumber = newvalue
		    Case libvlc.MetaDataType.URL
		      Player.Media.URL = newvalue
		    End Select
		    Player.Media.SaveMetaData()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadBtn
	#tag Event
		Sub Action()
		  Dim m As libvlc.Medium = OpenMedia.Load(Player.Media)
		  If m <> Nil Then LoadMedia(m)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SubtitleTracks
	#tag Event
		Sub Change()
		  If Me.RowTag(Me.ListIndex) <> Nil And Not mLock Then
		    Try
		      Player.TruePlayer.SubtitleIndex = Me.RowTag(Me.ListIndex).Int32Value
		    Catch err As libvlc.VLCException
		      MsgBox(err.Message)
		    End Try
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label1
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.FingerPointer
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  Dim f As FolderItem = GetOpenFolderItem(MediaFileTypes.SubRip)
		  If f = Nil Then Return
		  If Not Player.TruePlayer.SetSubtitleFile(f) Then
		    MsgBox("Unable to set subtitle file!")
		  End If
		  UpdateUI()
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
		    If Left(Player.Media.MediaURL, 4) = "dvd:" Then
		      Dim controls As New DVDNavigator(Player.TruePlayer)
		      controls.Show
		    End If
		  Else
		    Player.Pause
		    Me.Caption = "Play"
		  End If
		  PlayerTimer.Mode = Timer.ModeMultiple
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
#tag Events StopButton
	#tag Event
		Sub Action()
		  Player.Stop
		  'Self.Title = "'" + Player.MetaData.Lookup(libvlc.MetaDataType.Title, Player.Media.URL) + "'"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VolControl
	#tag Event
		Sub ValueChanged()
		  If Not mLock Then Player.Volume = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Player
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  
		  Dim play, pause, stop, resume, equ, opend, openf, showart As MenuItem
		  play = New MenuItem("Play")
		  stop = New MenuItem("Stop")
		  resume = New MenuItem("Resume")
		  pause = New MenuItem("Pause")
		  equ = New MenuItem("Equalizer")
		  openf = New MenuItem("Load file")
		  opend = New MenuItem("Load directory/disc")
		  showart = New MenuItem("View full sized artwork...")
		  play.Enabled = (Me.IsPlaying Or Me.Media <> Nil)
		  
		  base.Append(play)
		  base.Append(stop)
		  If Me.CurrentState = libvlc.PlayerState.PAUSED Then
		    base.Append(resume)
		  Else
		    base.Append(pause)
		  End If
		  base.Append(equ)
		  base.Append(openf)
		  base.Append(opend)
		  If mArtwork <> Nil Then
		    base.Append(showart)
		  End If
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case  hitItem.Text
		  Case "Play", "Resume"
		    Me.Play
		  Case "Stop"
		    Me.Stop
		  Case "Pause"
		    Me.Pause
		  Case "Equalizer"
		    Dim e As libvlc.Equalizer = EqualizerWindow.ShowEqualizer(Player.Equalizer)
		    If e <> Nil Then Player.Equalizer = e
		  Case "Load file"
		    Dim f As FolderItem = GetOpenFolderItem(MediaFileTypes.All)
		    If f <> Nil Then LoadMedia(f)
		  Case "Load directory/disc"
		    Dim f As FolderItem = SelectFolder()
		    If f <> Nil Then LoadMedia(f)
		  Case "View full sized artwork..."
		    Dim title As String
		    If mPlaylistWindow <> Nil Then
		      title = mLastItem
		    Else
		      title = Player.TruePlayer.Media.Title
		    End If
		    title = "'" + title + "'"
		    AlbumArtViewWindow.ShowAlbumArt(mArtwork, title)
		  End Select
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics)
		  Dim original As Picture
		  If mArtwork <> Nil Then original = mArtwork Else original = movielogo
		  
		  Dim wRatio, hRatio, ratio As Double
		  ratio = 1.0
		  If g.Width < original.Width Then ratio = g.Width / original.Width
		  If g.Height < original.Height Then ratio = Min(g.Height / original.Height, ratio)
		  wRatio = (ratio * original.width)
		  hRatio = (ratio * original.Height)
		  g.ForeColor = &c00000000
		  g.FillRect(0, 0, g.Width, g.Height)
		  g.DrawPicture(original, (g.Width - wRatio) / 2, (g.Height - hRatio) / 2, wRatio, hRatio, 0, 0, original.Width, original.Height)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ChangedState()
		  If Player = Nil Then Return
		  Dim url As String
		  If Player.Media <> Nil Then url = Player.Media.MediaURL
		  If Player.TruePlayer.Muted <> IsMuted.Value Then IsMuted.Value = Player.TruePlayer.Muted
		  
		  If Player.CurrentState = libvlc.PlayerState.PLAYING Then
		    PlayButton.Caption = "Pause"
		  Else
		    PlayButton.Caption = "Play"
		  End If
		  
		  If url = "" Then
		    PlayButton.Enabled = False
		    StopButton.Enabled = False
		    FullscreenBtn.Enabled = False
		    Slider1.Enabled = False
		    VolControl.Enabled = False
		    
		  Else
		    PlayButton.Enabled = True
		    StopButton.Enabled = True
		    FullscreenBtn.Enabled = True
		    Slider1.Enabled = True
		    VolControl.Enabled = True
		    Do Until Not mLock
		      App.YieldToNextThread
		    Loop
		    UpdateUI()
		  End If
		  If mPlaylistWindow <> Nil Then
		    Call mPlaylistWindow.NotifyStateChanged()
		    ReadMetaData(mPlaylistWindow.CurrentMedium)
		  End If
		  
		  'If Player.CurrentState = libvlc.PlayerState.ENDED Then Player.Stop
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.AcceptFileDrop(MediaFileTypes.All)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #pragma Unused action
		  LoadMedia(obj.FolderItem)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TimeTimer
	#tag Event
		Sub Action()
		  If Player <> Nil And Player.Media <> Nil Then
		    TimeLabel.Text = libvlc.FormatTime(Player.TimeMS, mFractionalSeconds) + "/" + libvlc.FormatTime(Player.LengthMS, mFractionalSeconds)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AspectRatio
	#tag Event
		Sub Change()
		  Dim s As String = Me.Text
		  If s <> "" And s <> mLastAspectRatio And Not mLock Then
		    If s = "Default" Then s = ""
		    Try
		      Player.TruePlayer.AspectRatio = s
		      mLastAspectRatio = s
		    Catch err As libvlc.VLCException
		      MsgBox(err.Message)
		    End Try
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadBtn1
	#tag Event
		Sub Action()
		  Dim dlg As New OpenDialog
		  dlg.Filter = MediaFileTypes.All
		  dlg.MultiSelect = True
		  If dlg.ShowModal() = Nil Then Return
		  Dim f() As FolderItem
		  For i As Integer = 0 To dlg.Count - 1
		    f.Append(dlg.Item(i))
		  Next
		  
		  LoadPlaylist(f)
		End Sub
	#tag EndEvent
#tag EndEvents
