#tag Window
Begin Window PlayerWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.43e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   True
   Title           =   "*"
   Visible         =   True
   Width           =   6.18e+2
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   118
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Controls\rMetadata"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   325
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   618
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
         Height          =   78
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Key	Value"
         Italic          =   ""
         Left            =   8
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
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   356
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   602
         _ScrollWidth    =   -1
      End
      Begin Slider VolControl
         AutoDeactivate  =   True
         Enabled         =   False
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   416
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Maximum         =   100
         Minimum         =   0
         PageStep        =   5
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         TickStyle       =   1
         Top             =   356
         Value           =   100
         Visible         =   True
         Width           =   195
      End
      Begin PushButton PauseButton
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
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   384
         Underline       =   ""
         Visible         =   True
         Width           =   80
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
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   178
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   384
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
         InitialParent   =   "TabPanel1"
         Left            =   11
         LineStep        =   1
         LiveScroll      =   True
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Maximum         =   100
         Minimum         =   0
         PageStep        =   1
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TickStyle       =   2
         Top             =   356
         Value           =   0
         Visible         =   True
         Width           =   396
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
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   94
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   384
         Underline       =   ""
         Visible         =   True
         Width           =   80
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
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   270
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Subtitle:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   384
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   55
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
         InitialParent   =   "TabPanel1"
         InitialValue    =   ""
         Italic          =   ""
         Left            =   329
         ListIndex       =   0
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   384
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   166
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
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   410
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
   End
   Begin VLCMediaPlayer Player
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      CaptureKeyboard =   ""
      CaptureMouse    =   ""
      DoubleBuffer    =   True
      Enabled         =   False
      EraseBackground =   False
      Fullscreen      =   ""
      Height          =   300
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsPlaying       =   ""
      Left            =   11
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Muted           =   ""
      Position        =   ""
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      UseFocusRing    =   True
      Visible         =   True
      Volume          =   ""
      Width           =   600
   End
   Begin Timer PlayerTimer
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   877
      LockedInPosition=   False
      Mode            =   2
      Period          =   500
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   366
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  If Player.IsPlaying Then Self.Refresh(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  'If Player.IsPlaying Then TabPanel1.Invalidate(True)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub LoadMedia(Media As libvlc.Medium)
		  'Player.CaptureKeyboard = False
		  'Player.CaptureMouse = False
		  If Media = Nil Then Return
		  Player.Media = Media
		  If Player.MetaData.HasKey(libvlc.Meta.MetaDataType.ArtworkURL) Then
		    Dim url As String = Player.MetaData.Value(libvlc.Meta.MetaDataType.ArtworkURL)
		    Dim data As MemoryBlock
		    Select Case Left(url, 5)
		      'Case "http:"
		      'Dim h As New HTTPSocket
		      'data = h.Get(url, 10)
		      
		    Case "file:"
		      Dim art As FolderItem = GetFolderItem(url, FolderItem.PathTypeURL)
		      If art <> Nil And art.Exists And Not art.Directory Then
		        Dim bs As BinaryStream = BinaryStream.Open(art)
		        data = bs.Read(bs.Length)
		        bs.Close
		      End If
		    End Select
		    If data <> Nil And data.Size > 0 Then mArtwork = Picture.FromData(data)
		  Else
		    mArtwork = Nil
		  End If
		  Self.Title = "'" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, Player.Media.URL) + "'"
		  MetaDataList.DeleteAllRows
		  MetaDataList.AddRow("Actors", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Actors, "Not set"))
		  MetaDataList.AddRow("Album", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Album, "Not set"))
		  MetaDataList.AddRow("AlbumArtist", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.AlbumArtist, "Not set"))
		  MetaDataList.AddRow("Artist", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Artist, "Not set"))
		  MetaDataList.AddRow("ArtworkURL", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.ArtworkURL, "Not set"))
		  MetaDataList.AddRow("Copyright", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Copyright, "Not set"))
		  MetaDataList.AddRow("Date", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Date, "Not set"))
		  MetaDataList.AddRow("Description", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Description, "Not set"))
		  MetaDataList.AddRow("Director", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Director, "Not set"))
		  MetaDataList.AddRow("DiscNumber", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.DiscNumber, "Not set"))
		  MetaDataList.AddRow("DiscTotal", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.DiscTotal, "Not set"))
		  MetaDataList.AddRow("EncodedBy", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.EncodedBy, "Not set"))
		  MetaDataList.AddRow("Episode", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Episode, "Not set"))
		  MetaDataList.AddRow("Genre", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Genre, "Not set"))
		  MetaDataList.AddRow("Language", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Language, "Not set"))
		  MetaDataList.AddRow("NowPlaying", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.NowPlaying, "Not set"))
		  MetaDataList.AddRow("Publisher", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Publisher, "Not set"))
		  MetaDataList.AddRow("Rating", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Rating, "Not set"))
		  MetaDataList.AddRow("Season", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Season, "Not set"))
		  MetaDataList.AddRow("Setting", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Setting, "Not set"))
		  MetaDataList.AddRow("ShowName", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.ShowName, "Not set"))
		  MetaDataList.AddRow("Title", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, "Not set"))
		  MetaDataList.AddRow("TrackID", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.TrackID, "Not set"))
		  MetaDataList.AddRow("TrackNumber", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.TrackNumber, "Not set"))
		  MetaDataList.AddRow("TrackTotal", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.TrackTotal, "Not set"))
		  MetaDataList.AddRow("URL", Player.MetaData.Lookup(libvlc.Meta.MetaDataType.URL, "Not set"))
		  Player.Invalidate(False)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mArtwork As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLock As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events VolControl
	#tag Event
		Sub ValueChanged()
		  If Not mLock Then Player.Volume = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PauseButton
	#tag Event
		Sub Action()
		  Player.Pause
		  Self.Title = "Paused '" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, Player.Media.URL) + "'"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  Player.Stop
		  Self.Title = "'" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, Player.Media.URL) + "'"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  If Not mLock Then Player.Position = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayButton
	#tag Event
		Sub Action()
		  Player.Play
		  Dim m As libvlc.Medium = Player.Media
		  Dim url As String = m.URL
		  Self.Title = "Playing '" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, url) + "'"
		  PlayerTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SubtitleTracks
	#tag Event
		Sub Change()
		  If Me.RowTag(Me.ListIndex) <> Nil Then
		    Player.TruePlayer.SubtitleIndex = Me.RowTag(Me.ListIndex).Int32Value
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
#tag Events Player
	#tag Event
		Sub Paint(g As Graphics)
		  Dim original As Picture
		  If mArtwork <> Nil Then original = mArtwork Else original = New Picture(g.Width, g.Height)
		  
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
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  
		  Dim play, pause, stop, resume, equ, opend, openf As MenuItem
		  play = New MenuItem("Play")
		  stop = New MenuItem("Stop")
		  resume = New MenuItem("Resume")
		  pause = New MenuItem("Pause")
		  equ = New MenuItem("Equalizer")
		  openf = New MenuItem("Load file")
		  opend = New MenuItem("Load directory/disc")
		  play.Enabled = (Me.IsPlaying Or Me.Media <> Nil)
		  
		  base.Append(play)
		  base.Append(stop)
		  If Me.TruePlayer.CurrentState = libvlc.PlayerState.PAUSED Then
		    base.Append(resume)
		  Else
		    base.Append(pause)
		  End If
		  base.Append(equ)
		  base.Append(openf)
		  base.Append(opend)
		  
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
		  End Select
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PlayerTimer
	#tag Event
		Sub Action()
		  If Player = Nil Then Return
		  Dim url As String
		  If Player.Media <> Nil Then url = Player.Media.URL
		  If url = "" Then
		    PauseButton.Enabled = False
		    PlayButton.Enabled = False
		    StopButton.Enabled = False
		    Slider1.Enabled = False
		    VolControl.Enabled = False
		    
		  Else
		    mLock = True
		    Try
		      Slider1.Value = Player.Position
		      VolControl.Value = Player.Volume
		    Finally
		      mLock = False
		    End Try
		    PauseButton.Enabled = True
		    PlayButton.Enabled = True
		    StopButton.Enabled = True
		    Slider1.Enabled = True
		    VolControl.Enabled = True
		    
		    Dim c As Integer = Player.TruePlayer.SubtitleCount
		    If Not SubtitleTracks.Enabled And c > 0 Then
		      SubtitleTracks.DeleteAllRows
		      If c > 0 Then
		        Dim lst As libvlc.Meta.TrackList = Player.TruePlayer.Subtitles
		        For i As Integer = 0 To c - 1
		          SubtitleTracks.AddRow(lst.Name(i))
		          SubtitleTracks.RowTag(SubtitleTracks.ListCount - 1) = lst.ID(i)
		        Next
		        SubtitleTracks.Enabled = True
		      Else
		        SubtitleTracks.Enabled = False
		      End If
		    End If
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
