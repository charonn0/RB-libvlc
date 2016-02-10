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
   MenuBar         =   531314687
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
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
      Begin PushButton EqualizerButton
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Equalizer"
         Default         =   ""
         Enabled         =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   15
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         TabIndex        =   8
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
      Begin Slider VolControl
         AutoDeactivate  =   True
         Enabled         =   False
         Height          =   23
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   358
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
         Top             =   409
         Value           =   100
         Visible         =   True
         Width           =   249
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
         Left            =   99
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
         Top             =   410
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
         Left            =   266
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
         Top             =   410
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
         Top             =   375
         Value           =   0
         Visible         =   True
         Width           =   596
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
         Left            =   182
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
         Top             =   410
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin Timer PlayerTimer
         Height          =   32
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   534
         LockedInPosition=   False
         Mode            =   2
         Period          =   500
         Scope           =   0
         TabPanelIndex   =   1
         Top             =   360
         Width           =   32
      End
   End
   Begin VLCMediaPlayer Player
      AcceptFocus     =   ""
      AcceptTabs      =   ""
      AutoDeactivate  =   True
      Backdrop        =   ""
      DoubleBuffer    =   True
      Enabled         =   False
      EraseBackground =   False
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


	#tag MenuHandler
		Function OpenDir() As Boolean Handles OpenDir.Action
			Dim f As FolderItem = SelectFolder()
			If f <> Nil Then LoadMedia(f)
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function OpenMedia() As Boolean Handles OpenMedia.Action
			Dim f As FolderItem = GetOpenFolderItem(MediaFileTypes.All)
			If f <> Nil Then LoadMedia(f)
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub LoadMedia(f As FolderItem)
		  Player.CaptureKeyboard = False
		  Player.CaptureMouse = False
		  If f <> Nil Then
		    Player.Media = New libvlc.VLCMedium(f)
		    If Player.MetaData.HasKey(libvlc.MetaDataType.ArtworkURL) Then
		      Dim url As String = Player.MetaData.Value(libvlc.MetaDataType.ArtworkURL)
		      Dim data As MemoryBlock
		      Select Case Left(url, 5)
		      Case "http:"
		        Dim h As New HTTPSocket
		        data = h.Get(url, 10)
		        
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
		    Self.Title = "'" + Player.MetaData.Lookup(libvlc.MetaDataType.Title, Player.Media.URL) + "'"
		    MetaDataList.DeleteAllRows
		    MetaDataList.AddRow("Actors", Player.MetaData.Lookup(libvlc.MetaDataType.Actors, "Not set"))
		    MetaDataList.AddRow("Album", Player.MetaData.Lookup(libvlc.MetaDataType.Album, "Not set"))
		    MetaDataList.AddRow("AlbumArtist", Player.MetaData.Lookup(libvlc.MetaDataType.AlbumArtist, "Not set"))
		    MetaDataList.AddRow("Artist", Player.MetaData.Lookup(libvlc.MetaDataType.Artist, "Not set"))
		    MetaDataList.AddRow("ArtworkURL", Player.MetaData.Lookup(libvlc.MetaDataType.ArtworkURL, "Not set"))
		    MetaDataList.AddRow("Copyright", Player.MetaData.Lookup(libvlc.MetaDataType.Copyright, "Not set"))
		    MetaDataList.AddRow("Date", Player.MetaData.Lookup(libvlc.MetaDataType.Date, "Not set"))
		    MetaDataList.AddRow("Description", Player.MetaData.Lookup(libvlc.MetaDataType.Description, "Not set"))
		    MetaDataList.AddRow("Director", Player.MetaData.Lookup(libvlc.MetaDataType.Director, "Not set"))
		    MetaDataList.AddRow("DiscNumber", Player.MetaData.Lookup(libvlc.MetaDataType.DiscNumber, "Not set"))
		    MetaDataList.AddRow("DiscTotal", Player.MetaData.Lookup(libvlc.MetaDataType.DiscTotal, "Not set"))
		    MetaDataList.AddRow("EncodedBy", Player.MetaData.Lookup(libvlc.MetaDataType.EncodedBy, "Not set"))
		    MetaDataList.AddRow("Episode", Player.MetaData.Lookup(libvlc.MetaDataType.Episode, "Not set"))
		    MetaDataList.AddRow("Genre", Player.MetaData.Lookup(libvlc.MetaDataType.Genre, "Not set"))
		    MetaDataList.AddRow("Language", Player.MetaData.Lookup(libvlc.MetaDataType.Language, "Not set"))
		    MetaDataList.AddRow("NowPlaying", Player.MetaData.Lookup(libvlc.MetaDataType.NowPlaying, "Not set"))
		    MetaDataList.AddRow("Publisher", Player.MetaData.Lookup(libvlc.MetaDataType.Publisher, "Not set"))
		    MetaDataList.AddRow("Rating", Player.MetaData.Lookup(libvlc.MetaDataType.Rating, "Not set"))
		    MetaDataList.AddRow("Season", Player.MetaData.Lookup(libvlc.MetaDataType.Season, "Not set"))
		    MetaDataList.AddRow("Setting", Player.MetaData.Lookup(libvlc.MetaDataType.Setting, "Not set"))
		    MetaDataList.AddRow("ShowName", Player.MetaData.Lookup(libvlc.MetaDataType.ShowName, "Not set"))
		    MetaDataList.AddRow("Title", Player.MetaData.Lookup(libvlc.MetaDataType.Title, "Not set"))
		    MetaDataList.AddRow("TrackID", Player.MetaData.Lookup(libvlc.MetaDataType.TrackID, "Not set"))
		    MetaDataList.AddRow("TrackNumber", Player.MetaData.Lookup(libvlc.MetaDataType.TrackNumber, "Not set"))
		    MetaDataList.AddRow("TrackTotal", Player.MetaData.Lookup(libvlc.MetaDataType.TrackTotal, "Not set"))
		    MetaDataList.AddRow("URL", Player.MetaData.Lookup(libvlc.MetaDataType.URL, "Not set"))
		  End If
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

#tag Events EqualizerButton
	#tag Event
		Sub Action()
		  Dim e As libvlc.Equalizer = EqualizerWindow.ShowEqualizer(Player.Equalizer)
		  If e <> Nil Then Player.Equalizer = e
		  'If Player.Fullscreen Then
		  'Player.Fullscreen = False
		  'Else
		  'Player.Fullscreen = True
		  'End If
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
		  Self.Title = "Paused '" + Player.MetaData.Lookup(libvlc.MetaDataType.Title, Player.Media.URL) + "'"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  Player.Stop
		  Self.Title = "'" + Player.MetaData.Lookup(libvlc.MetaDataType.Title, Player.Media.URL) + "'"
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
		  Dim m As libvlc.VLCMedium = Player.Media
		  Dim url As String = m.URL
		  Self.Title = "Playing '" + Player.MetaData.Lookup(libvlc.MetaDataType.Title, url) + "'"
		  PlayerTimer.Mode = Timer.ModeMultiple
		End Sub
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
		    EqualizerButton.Enabled = False
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
		    EqualizerButton.Enabled = True
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Player
	#tag Event
		Sub Paint(g As Graphics)
		  Dim original As Picture
		  If mArtwork <> Nil Then original = mArtwork Else original = standby
		  
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
		Sub DoubleClick(X As Integer, Y As Integer)
		  Break
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Break
		End Function
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  Break
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Break
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Break
		End Function
	#tag EndEvent
#tag EndEvents
