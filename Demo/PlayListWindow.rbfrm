#tag Window
Begin Window PlayListWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.17e+2
   ImplicitInstance=   False
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
   Placement       =   0
   Resizeable      =   True
   Title           =   "Playlist"
   Visible         =   True
   Width           =   6.16e+2
   Begin Listbox MediaList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   True
      ColumnWidths    =   "30%,30%,25%,*"
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
      Height          =   187
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Title	Artist	Album	Length"
      Italic          =   ""
      Left            =   0
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
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   616
      _ScrollWidth    =   -1
   End
   Begin PushButton PrevTrackBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "<<"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   "Previous track"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   192
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton StopBtn
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
      Left            =   87
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   192
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PlayBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Play"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   170
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   192
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton NextTrackBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   ">>"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   "Next track"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   254
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   192
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu PlayModeMnu
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Loop none\r\nLoop track\r\nLoop list"
      Italic          =   ""
      Left            =   528
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   192
      Underline       =   ""
      Visible         =   True
      Width           =   88
   End
   Begin Timer UITimer
      Height          =   32
      Index           =   -2147483648
      Left            =   634
      LockedInPosition=   False
      Mode            =   2
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   21
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  UITimer.Mode = Timer.ModeOff
		  If mParentWindow <> Nil Then mParentWindow.NotifyListClosed(Me)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ListPlayerStateChangedHandler(Sender As libvlc.PlayLists.ListPlayer)
		  #pragma Unused Sender
		  Call NotifyStateChanged()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotifyStateChanged() As String
		  If PrevTrackBtn = Nil Then ' window has closed
		    Return "!INVALID"
		  End If
		  UpdateUI()
		  If CurrentIndex > -1 Then Return MediaList.Cell(CurrentIndex, 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowList(PlayerWindow As PlayerWindow, ListPlayer As libvlc.VLCPlayer, List() As libvlc.Medium)
		  If mPlayer = Nil Then
		    mPlayer = New libvlc.PlayLists.ListPlayer(ListPlayer)
		    AddHandler mPlayer.ChangedState, WeakAddressOf ListPlayerStateChangedHandler
		  End If
		  Self.Show()
		  Self.Left = PlayerWindow.Left + PlayerWindow.Width
		  
		  Dim truelist As libvlc.PlayLists.PlayList = mPlayer.Playlist
		  For i As Integer = 0 To UBound(List)
		    Dim m As libvlc.Medium = List(i)
		    If truelist.IndexOf(m) > -1 Then Continue ' already added
		    truelist.Append(m)
		    MediaList.AddRow(m.Title, m.Artist, m.Album, libvlc.FormatTime(m.DurationMS))
		    MediaList.RowTag(MediaList.LastIndex) = m
		  Next
		  mPlayer.Playlist = truelist
		  UpdateUI()
		  mParentWindow = PlayerWindow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateUI()
		  PrevTrackBtn.Enabled = mPlayer.CanMovePrev()
		  NextTrackBtn.Enabled = mPlayer.CanMoveNext()
		  If mPlayer.CurrentState = libvlc.PlayerState.PLAYING Then
		    PlayBtn.Caption = "Pause"
		    StopBtn.Enabled = True
		  Else
		    PlayBtn.Caption = "Play"
		    StopBtn.Enabled = False
		  End If
		  If mLastActive <> mPlayer.ListIndex Then
		    mLastActive = mPlayer.ListIndex
		    For i As Integer = 0 To MediaList.ListCount - 1
		      ' force the MediaList to repaint all the cells in the row
		      For j As Integer = 0 To MediaList.ColumnCount - 1
		        MediaList.Cell(i, j) = MediaList.Cell(i, j)
		      Next
		    Next
		    MediaList.Refresh()
		  End If
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.ListCount
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.ListIndex
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.ListIndex = value
			End Set
		#tag EndSetter
		CurrentIndex As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then
			    Dim m As libvlc.Medium = mPlayer.Playlist.Item(mPlayer.ListIndex)
			    If m = Nil Then Return Nil
			    If Not m.IsParsed Then m.Parse
			    Return New libvlc.Meta.MetaData(m)
			  End If
			  
			End Get
		#tag EndGetter
		CurrentMeta As libvlc.Meta.MetaData
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLastActive As Integer = -2
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mParentWindow As PlayerWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlayer As libvlc.PlayLists.ListPlayer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mPlayer <> Nil Then Return mPlayer.PlayMode
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mPlayer <> Nil Then mPlayer.PlayMode = value
			End Set
		#tag EndSetter
		PlayMode As libvlc.PlaybackMode
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events MediaList
	#tag Event
		Sub Open()
		  Me.AcceptFileDrop(MediaFileTypes.All)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #pragma Unused action
		  Do
		    If obj.FolderItem <> Nil Then
		      Dim m As libvlc.Medium = obj.FolderItem
		      mPlayer.Playlist.Append(m)
		      MediaList.AddRow(m.Title, m.Artist, m.Album, libvlc.FormatTime(m.DurationMS))
		      MediaList.RowTag(MediaList.LastIndex) = m
		    End If
		  Loop Until Not obj.NextItem()
		  mLastActive = -2
		  
		  
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function SortColumn(column As Integer) As Boolean
		  #pragma Unused column
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #pragma Unused column
		  If mPlayer = Nil Then Return False
		  If row = mPlayer.ListIndex Then
		    g.ForeColor = &c0080FF66
		    g.FillRect(0, 0, g.Width, g.Height)
		    Return True
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused column
		  #pragma Unused x
		  #pragma Unused y
		  If mPlayer = Nil Then Return False
		  If row = mPlayer.ListIndex Then
		    g.Bold = True
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PrevTrackBtn
	#tag Event
		Sub Action()
		  If mPlayer.CanMovePrev() Then Call mPlayer.MovePrev()
		  ' NotifyStateChanged(libvlc.PlayerState.PLAYING)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StopBtn
	#tag Event
		Sub Action()
		  mPlayer.Stop()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayBtn
	#tag Event
		Sub Action()
		  If Me.Caption = "Play" Then
		    mPlayer.Play()
		    Me.Caption = "Pause"
		  Else
		    mPlayer.Pause
		    Me.Caption = "Play"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextTrackBtn
	#tag Event
		Sub Action()
		  If mPlayer.CanMoveNext() Then Call mPlayer.MoveNext()
		  ' NotifyStateChanged(libvlc.PlayerState.PLAYING)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayModeMnu
	#tag Event
		Sub Change()
		  Dim newmode As libvlc.PlaybackMode
		  Select Case Me.Text
		  Case "Loop none"
		    newmode = libvlc.PlaybackMode.Default
		  Case "Loop track"
		    newmode = libvlc.PlaybackMode.Repeat
		  Case "Loop list"
		    newmode = libvlc.PlaybackMode.Looping
		  Else
		    Return
		  End Select
		  
		  If mPlayer.PlayMode <> newmode Then mPlayer.PlayMode = newmode
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UITimer
	#tag Event
		Sub Action()
		  UpdateUI()
		End Sub
	#tag EndEvent
#tag EndEvents
