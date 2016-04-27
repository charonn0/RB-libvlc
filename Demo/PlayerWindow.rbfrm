#tag Window
Begin Window PlayerWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   5.26e+2
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
   Begin Timer PlayerTimer
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   643
      LockedInPosition=   False
      Mode            =   2
      Period          =   500
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   282
      Width           =   32
   End
   Begin Slider VolControl
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   416
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Minimum         =   0
      PageStep        =   5
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   1
      Top             =   326
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   11
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   354
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   178
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
      Top             =   354
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
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   2
      Top             =   326
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   94
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
      Top             =   354
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   103
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
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   382
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
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   ""
      Left            =   162
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
      Top             =   382
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
      InitialParent   =   ""
      Italic          =   ""
      Left            =   11
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
      Top             =   380
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Metadata"
      Enabled         =   True
      Height          =   100
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   11
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
      Top             =   414
      Underline       =   ""
      Visible         =   True
      Width           =   587
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
         Height          =   74
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   "Key	Value"
         Italic          =   ""
         Left            =   20
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
         Top             =   432
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   568
         _ScrollWidth    =   -1
      End
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
      Left            =   416
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
      Top             =   353
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
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
      Left            =   340
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
      Top             =   381
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   93
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
      InitialValue    =   ""
      Italic          =   ""
      Left            =   439
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
      Top             =   380
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   172
   End
   Begin libvlc.VLCMediaPlayer Player
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   ""
      CaptureKeyboard =   True
      CaptureMouse    =   True
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Fullscreen      =   ""
      Height          =   314
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsPlaying       =   ""
      Left            =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Muted           =   False
      Position        =   0.0
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   True
      Visible         =   True
      Volume          =   100
      Width           =   617
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
		  'Self.Title = "'" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, Player.Media.URL) + "'"
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

#tag Events PlayerTimer
	#tag Event
		Sub Action()
		  If Player = Nil Then Return
		  Dim url As String
		  If Player.Media <> Nil Then url = Player.Media.URL
		  If Player.TruePlayer.Muted <> IsMuted.Value Then IsMuted.Value = Player.TruePlayer.Muted
		  Dim wndttl As String
		  Select Case Player.TruePlayer.CurrentState
		  Case libvlc.PlayerState.BUFFERING
		    wndttl = "(buffering)"
		  Case libvlc.PlayerState.ENDED
		    wndttl = "(finished)"
		  Case libvlc.PlayerState.ERROR
		    wndttl = "(error)"
		  Case libvlc.PlayerState.IDLE
		    wndttl = "(idle)"
		  Case libvlc.PlayerState.OPENING
		    wndttl = "(opening)"
		  Case libvlc.PlayerState.PAUSED
		    wndttl = "(paused)"
		  Case libvlc.PlayerState.PLAYING
		    wndttl = "(playing)"
		  Case libvlc.PlayerState.STOPPING
		    wndttl = "(stopping)"
		  End Select
		  
		  If Player.MetaData <> Nil Then 
		    Self.Title = "'" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, url) + "' " + wndttl
		  Else
		    Self.Title = "libvlc demo"
		  End If
		  
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
		    
		    c = Player.TruePlayer.VideoTrackCount
		    If Not VideoTracks.Enabled And c > 0 Then
		      VideoTracks.DeleteAllRows
		      If c > 0 Then
		        Dim lst As libvlc.Meta.TrackList = Player.TruePlayer.VideoTracks
		        For i As Integer = 0 To c - 1
		          VideoTracks.AddRow(lst.Name(i))
		          VideoTracks.RowTag(VideoTracks.ListCount - 1) = lst.ID(i)
		        Next
		        VideoTracks.Enabled = True
		      Else
		        VideoTracks.Enabled = False
		      End If
		    End If
		    
		  End If
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
#tag Events PauseButton
	#tag Event
		Sub Action()
		  Player.Pause
		  'Self.Title = "Paused '" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, Player.Media.URL) + "'"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  Player.Stop
		  'Self.Title = "'" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, Player.Media.URL) + "'"
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
		  'Dim m As libvlc.Medium = Player.Media
		  'Dim url As String = m.URL
		  'Self.Title = "Playing '" + Player.MetaData.Lookup(libvlc.Meta.MetaDataType.Title, url) + "'"
		  PlayerTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SubtitleTracks
	#tag Event
		Sub Change()
		  If Me.RowTag(Me.ListIndex) <> Nil Then
		    Try
		      Player.TruePlayer.SubtitleIndex = Me.RowTag(Me.ListIndex).Int32Value
		    Catch err As libvlc.VLCException
		      MsgBox(err.Message)
		    End Try
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
#tag Events IsMuted
	#tag Event
		Sub Action()
		  Player.TruePlayer.Muted = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VideoTracks
	#tag Event
		Sub Change()
		  If Me.RowTag(Me.ListIndex) <> Nil Then
		    Try
		      Player.TruePlayer.VideoTrack = Me.RowTag(Me.ListIndex).Int32Value
		    Catch err As libvlc.VLCException
		      MsgBox(err.Message)
		    End Try
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Player
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
#tag EndEvents