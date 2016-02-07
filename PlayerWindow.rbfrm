#tag Window
Begin Window PlayerWindow
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   4.25e+2
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
   Width           =   6.0e+2
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   425
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Tab 0\rTab 1"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   600
      Begin Slider Slider1
         AutoDeactivate  =   True
         Enabled         =   False
         Height          =   9
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
         Top             =   379
         Value           =   0
         Visible         =   True
         Width           =   578
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
         Left            =   183
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   392
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
         Top             =   392
         Underline       =   ""
         Visible         =   True
         Width           =   80
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
         Top             =   392
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
         Top             =   391
         Value           =   100
         Visible         =   True
         Width           =   231
      End
      Begin Timer PlayerTimer
         Height          =   32
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   433
         LockedInPosition=   False
         Mode            =   2
         Period          =   500
         Scope           =   0
         TabPanelIndex   =   1
         Top             =   367
         Width           =   32
      End
      Begin VLCMediaPlayer Player
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         DoubleBuffer    =   True
         Enabled         =   True
         EraseBackground =   False
         Height          =   331
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   30
         UseFocusRing    =   True
         Visible         =   True
         Width           =   578
      End
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
         Height          =   385
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
         Top             =   31
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   584
         _ScrollWidth    =   -1
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  TabPanel1.Invalidate
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  TabPanel1.Invalidate(False)
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function OpenMedia() As Boolean Handles OpenMedia.Action
			LoadMedia()
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub LoadMedia()
		  Dim f As FolderItem = GetOpenFolderItem(MediaFileTypes.All)
		  If f <> Nil Then
		    Player.MediaFile = f
		    
		    Self.Title = "'" + Player.MetaData.Lookup(libvlc.MetaDataType.Title, Player.MediaURL) + "'"
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
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLock As Boolean
	#tag EndProperty


#tag EndWindowCode

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
		  Self.Title = "Playing '" + Player.MetaData.Lookup(libvlc.MetaDataType.Title, Player.MediaURL) + "'"
		  PlayerTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopButton
	#tag Event
		Sub Action()
		  Player.Stop
		  Self.Title = "'" + Player.MetaData.Lookup(libvlc.MetaDataType.Title, Player.MediaURL) + "'"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PauseButton
	#tag Event
		Sub Action()
		  Player.Pause
		  Self.Title = "Paused '" + Player.MetaData.Lookup(libvlc.MetaDataType.Title, Player.MediaURL) + "'"
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
#tag Events PlayerTimer
	#tag Event
		Sub Action()
		  If Player = Nil Then Return
		  If Player.MediaFile = Nil And Player.MediaURL = "" Then
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
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
