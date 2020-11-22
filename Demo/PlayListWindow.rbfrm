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
      EnableDrag      =   True
      EnableDragReorder=   True
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   188
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
      SelectionType   =   1
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
   Begin BevelButton LockWindowBtn
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   "&c00000000"
      Bevel           =   0
      Bold            =   False
      ButtonType      =   1
      Caption         =   "🔓"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   ""
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   "&c00000000"
      TextFont        =   "System"
      TextSize        =   ""
      TextUnit        =   0
      Top             =   192
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   24
   End
   Begin Thread DirectoryLoader
      Height          =   32
      Index           =   -2147483648
      Left            =   634
      LockedInPosition=   False
      Priority        =   3
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   52
      Width           =   32
   End
   Begin Timer DirectoryLoadComplete
      Height          =   32
      Index           =   -2147483648
      Left            =   665
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   52
      Width           =   32
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
      Left            =   101
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   24
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
      Left            =   352
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   27
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
   Begin PushButton AddFilesBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Add files(s)"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   "Next track"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   435
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
      Left            =   525
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   190
      Underline       =   ""
      Visible         =   True
      Width           =   88
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
      Left            =   185
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
      Left            =   268
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   26
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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  UITimer.Mode = Timer.ModeOff
		  If mParentWindow <> Nil Then mParentWindow.NotifyListClosed(Me)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  mPendingDirectoriesLock = New Semaphore
		  mPendingMediaLock = New Semaphore
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddDirectory(Target As FolderItem)
		  Dim c As Integer = Target.Count
		  For i As Integer = 1 To c
		    Dim item As FolderItem = Target.Item(i)
		    If item.Directory Then
		      AddDirectory(item)
		    Else
		      Dim m As libvlc.Medium = item
		      If mPlayer.Playlist.IndexOf(m) > -1 Then Continue ' already added
		      mPlayer.Playlist.Append(m)
		      MediaList.AddRow(m.Title, m.Artist, m.Album, libvlc.FormatTime(m.DurationMS))
		      MediaList.RowTag(MediaList.LastIndex) = m
		    End If
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddMedia(List() As libvlc.Medium, UIOnly As Boolean = False)
		  Dim truelist As libvlc.PlayLists.PlayList = mPlayer.Playlist
		  For i As Integer = 0 To UBound(List)
		    Dim m As libvlc.Medium = List(i)
		    If truelist.IndexOf(m) > -1 Then Continue ' already added
		    If Not UIOnly Then truelist.Append(m)
		    MediaList.AddRow(m.Title, m.Artist, m.Album, libvlc.FormatTime(m.DurationMS))
		    MediaList.RowTag(MediaList.LastIndex) = m
		  Next
		  mPlayer.Playlist = truelist
		End Sub
	#tag EndMethod

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
		  mDirty = mLastState <> mPlayer.CurrentState
		  mLastState = mPlayer.CurrentState
		  UpdateUI()
		  If CurrentIndex > -1 Then
		    Return MediaList.Cell(CurrentIndex, 0)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowList(PlayerWindow As PlayerWindow, ListPlayer As libvlc.VLCPlayer, List() As libvlc.Medium)
		  If mPlayer = Nil Then
		    mPlayer = New libvlc.PlayLists.ListPlayer(ListPlayer)
		    AddHandler mPlayer.ChangedState, WeakAddressOf ListPlayerStateChangedHandler
		  End If
		  Self.Show()
		  
		  PlayerWindow.Left = PlayerWindow.Left - (Self.Width / 2)
		  Self.Left = PlayerWindow.Left + PlayerWindow.Width
		  Self.Top = PlayerWindow.Top
		  Self.Height = PlayerWindow.Height
		  
		  AddMedia(List)
		  UpdateUI()
		  mParentWindow = PlayerWindow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateUI()
		  If mDirty Then
		    PrevTrackBtn.Enabled = mPlayer.CanMovePrev()
		    NextTrackBtn.Enabled = mPlayer.CanMoveNext()
		    If mPlayer.CurrentState = libvlc.PlayerState.PLAYING Then
		      PlayBtn.Caption = "Pause"
		      StopBtn.Enabled = True
		    Else
		      PlayBtn.Caption = "Play"
		      StopBtn.Enabled = False
		    End If
		    mDirty = False
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
			    Dim m As libvlc.Medium = mPlayer.Playlist(mPlayer.ListIndex)
			    If m = Nil Then Return Nil
			    If Not m.IsParsed Then m.Parse
			    Return m
			  End If
			  
			End Get
		#tag EndGetter
		CurrentMedium As libvlc.Medium
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLockToParentWindow
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLockToParentWindow = value
			End Set
		#tag EndSetter
		LockToParentWindow As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCompleted As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastActive As Integer = -2
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastState As libvlc.PlayerState
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLockToParentWindow As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mParentWindow As PlayerWindow
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPendingDirectories() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPendingDirectoriesLock As Semaphore
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPendingMedia() As libvlc.Medium
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPendingMediaLock As Semaphore
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
		  Me.AcceptFileDrop(DemoFileTypes.All)
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #pragma Unused action
		  Do
		    If obj.FolderItem <> Nil Then
		      Dim f As FolderItem = obj.FolderItem
		      If f.Directory Then
		        If MsgBox("Recursively scan '" + f.Name + "'?", 4 + 48, "Confirm action") = 6 Then
		          AddDirectory(f)
		        End If
		      Else
		        Dim m As libvlc.Medium = obj.FolderItem
		        mPlayer.Playlist.Append(m)
		        MediaList.AddRow(m.Title, m.Artist, m.Album, libvlc.FormatTime(m.DurationMS))
		        MediaList.RowTag(MediaList.LastIndex) = m
		      End If
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
		    Dim startcolor As Color = &c0080FF00
		    Dim endcolor As Color = &c7DBEFF00
		    
		    Dim ratio, endratio as Double
		    For i As Integer = 0 To g.Height + 1
		      ratio = ((g.Height - i) / g.Height)
		      endratio = (i / g.Height)
		      g.ForeColor = RGB(EndColor.Red * endratio + StartColor.Red * ratio, EndColor.Green * endratio + StartColor.Green * ratio, _
		      EndColor.Blue * endratio + StartColor.Blue * ratio)
		      g.DrawLine(0, i, g.Width, i)
		    next
		    
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
		    g.ForeColor = &cFFFFFF00
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  drag.Text = Str(row)
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  #pragma Unused parentRow
		  Dim m As libvlc.Medium = mPlayer.Playlist(Me.ListIndex)
		  mPlayer.Playlist.Remove(Me.ListIndex)
		  mPlayer.Playlist.Insert(newPosition, m)
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  Dim x As Integer = Me.MouseX
		  Dim y As Integer = Me.MouseY
		  Dim row As Integer = Me.RowFromXY(x, y)
		  If row < 0 Then Return
		  mPlayer.ListIndex = row
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim row As Integer = Me.RowFromXY(x, y)
		  Dim ok As Boolean
		  If row >= 0 Then
		    Dim remove As New MenuItem("Remove")
		    remove.Tag = row
		    base.Append(remove)
		    ok = True
		  End If
		  If Me.SelCount > 1 Then
		    Dim removeselected As New MenuItem("Remove all selected")
		    base.Append(removeselected)
		    ok = True
		  End If
		  
		  Return ok
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Remove"
		    Dim row As Integer = hitItem.Tag
		    mPlayer.Playlist.Remove(row)
		    Me.RemoveRow(row)
		    Return True
		    
		  Case "Remove all selected"
		    For i As Integer = Me.ListCount - 1 DownTo 0
		      If Me.Selected(i) Then
		        mPlayer.Playlist.Remove(i)
		        Me.RemoveRow(i)
		      End If
		    Next
		    Return True
		    
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  Return IsContextualClick And Me.SelCount <> 0
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events UITimer
	#tag Event
		Sub Action()
		  UpdateUI()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LockWindowBtn
	#tag Event
		Sub Action()
		  If Me.Value Then
		    Me.Caption = "🔒"
		    Self.Left = PlayerWindow.Left + PlayerWindow.Width
		    Self.Top = PlayerWindow.Top
		    Self.Height = PlayerWindow.Height
		    Me.HelpTag = "Unlock from parent window"
		  Else
		    Me.Caption = "🔓"
		    Me.HelpTag = "Lock to parent window"
		  End If
		  mLockToParentWindow = Me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Value = mLockToParentWindow
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DirectoryLoader
	#tag Event
		Sub Run()
		  Do Until UBound(mPendingDirectories) = -1
		    Do Until mPendingDirectoriesLock.TrySignal()
		      App.YieldToNextThread
		    Loop
		    Dim thisdir As FolderItem
		    Try
		      thisdir = mPendingDirectories.Pop
		    Finally
		      mPendingDirectoriesLock.Release()
		    End Try
		    Dim c As Integer = thisdir.Count
		    Dim media() As libvlc.Medium
		    Dim dirs() As FolderItem
		    For i As Integer = 1 To c
		      Dim item As FolderItem = thisdir.Item(i)
		      If item.Directory Then
		        dirs.Append(item)
		      ElseIf item.IsAMediaFile Then
		        media.Append(item)
		      End If
		    Next
		    
		    Do Until mPendingMediaLock.TrySignal()
		      App.YieldToNextThread
		    Loop
		    Try
		      For i As Integer = 0 To UBound(media)
		        mPendingMedia.Insert(0, media(i))
		      Next
		    Finally
		      mPendingMediaLock.Release()
		    End Try
		    
		    Do Until mPendingDirectoriesLock.TrySignal()
		      App.YieldToNextThread
		    Loop
		    Try
		      For i As Integer = 0 To UBound(dirs)
		        mPendingDirectories.Insert(0, dirs(i))
		      Next
		    Finally
		      mPendingDirectoriesLock.Release()
		    End Try
		    DirectoryLoadComplete.Mode = Timer.ModeSingle
		    App.YieldToNextThread
		  Loop
		  
		  mCompleted = True
		  DirectoryLoadComplete.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DirectoryLoadComplete
	#tag Event
		Sub Action()
		  Do Until mPendingMediaLock.TrySignal()
		    App.YieldToNextThread()
		  Loop
		  Try
		    AddMedia(mPendingMedia)
		    ReDim mPendingMedia(-1)
		  Finally
		    mPendingMediaLock.Release()
		  End Try
		  If mCompleted = True Then
		    MsgBox("Load complete")
		    mCompleted = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrevTrackBtn
	#tag Event
		Sub Action()
		  If mPlayer.CanMovePrev() Then Call mPlayer.MovePrev()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextTrackBtn
	#tag Event
		Sub Action()
		  If mPlayer.CanMoveNext() Then Call mPlayer.MoveNext()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddFilesBtn
	#tag Event
		Sub Action()
		  Dim dir As FolderItem = SelectFolder()
		  If dir <> Nil Then
		    Do Until mPendingDirectoriesLock.TrySignal
		      App.YieldToNextThread
		    Loop
		    Try
		      mPendingDirectories.Insert(0, dir)
		    Finally
		      mPendingDirectoriesLock.Release()
		    End Try
		    
		    Select Case DirectoryLoader.State
		    Case Thread.Running, Thread.Waiting, Thread.Sleeping
		      Return
		    Case Thread.Suspended
		      DirectoryLoader.Resume
		    Case Thread.NotRunning
		      DirectoryLoader.Run
		    End Select
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PlayModeMnu
	#tag Event
		Sub Change()
		  Dim newmode As libvlc.PlaybackMode
		  Select Case Me.Text
		  Case "Loop none"
		    Self.Title = "Playlist"
		    newmode = libvlc.PlaybackMode.Default
		  Case "Loop track"
		    Self.Title = "Playlist (Repeat track)"
		    newmode = libvlc.PlaybackMode.Repeat
		  Case "Loop list"
		    Self.Title = "Playlist (Repeat list)"
		    newmode = libvlc.PlaybackMode.Looping
		  Else
		    Return
		  End Select
		  
		  If mPlayer.PlayMode <> newmode Then mPlayer.PlayMode = newmode
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
		    mPlayer.Pause()
		    Me.Caption = "Play"
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
