#tag Class
Protected Class PlayList
Inherits libvlc.VLCInstance
	#tag Method, Flags = &h0
		Sub Append(Medium As libvlc.Medium)
		  ' Append a medium to the playlist.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Append
		  
		  Me.Lock()
		  Try
		    If libvlc_media_list_add_media(mList, Medium.Handle) <> 0 Then Raise New VLCException("Unable to add media to the media list.")
		  Finally
		    Me.Unlock()
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' Creates a new, empty playlist.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Constructor
		  
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From VLCInstance
		  Super.Constructor()
		  mList = libvlc_media_list_new(Me.Instance)
		  If mList = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC media list.")
		  mLock = New Semaphore
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor(FromMedium As libvlc.Medium)
		  ' Creates a new playlist from the sub-items of the FromMedium (e.g. the tracks on a CD)
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(AddRef As VLCInstance) -- From VLCInstance
		  Super.Constructor(FromMedium)
		  mList = libvlc_media_subitems(FromMedium.Handle)
		  If mList = Nil Then mList = libvlc_media_list_new(Me.Instance) ' no sub-items, create an empty list
		  If mList = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC media list.")
		  mLock = New Semaphore
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  ' Constructs an instance of PlayList using FromPtr. If AddRef is True then libvlc's internal reference count for the
		  ' FromPtr is incremented. The reference count will be decremented by PlayList.Destructor; refer to the VLC documentation
		  ' for the function that gave you FromPtr to determine whether the reference count should be incremented.
		  
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From VLCInstance
		  Super.Constructor()
		  If AddRef Then libvlc_media_list_retain(FromPtr)
		  mLock = New Semaphore
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Create(MediaFiles() As FolderItem) As libvlc.PlayList
		  ' Creates a PlayList from the specified array of media and returns
		  ' a reference to the list.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Create
		  
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaFiles)
		    m.Append(MediaFiles(i))
		  Next
		  Return Create(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Create(Media() As libvlc.Medium) As libvlc.PlayList
		  ' Creates a PlayList from the specified array of media and returns
		  ' a reference to the list.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Create
		  
		  Return Media
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Create(MediaURLs() As String) As libvlc.PlayList
		  ' Creates a PlayList from the specified array of media and returns
		  ' a reference to the list.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Create
		  
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaURLs)
		    m.Append(MediaURLs(i))
		  Next
		  Return Create(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mList <> Nil Then libvlc_media_list_release(mList)
		  mList = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(Medium As libvlc.Medium) As Integer
		  ' Returns the index of the Medium in the PlayList, or -1 if not present.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.IndexOf
		  
		  If mList = Nil Then Return -1
		  Dim ret As Integer
		  Me.Lock()
		  Try
		    ret = libvlc_media_list_index_of_item(mList, Medium.Handle)
		  Finally
		    Me.Unlock()
		  End Try
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Insert(Index As Integer, Medium As libvlc.Medium)
		  ' Inserts the specified Medium in the PlayList at Index.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Insert
		  
		  If mList = Nil Then Raise New OutOfBoundsException
		  Me.Lock()
		  Try
		    If libvlc_media_list_insert_media(mList, Medium.Handle, Index) <> 0 Then Raise New VLCException("Unable to insert media into the media list.")
		  Finally
		    Me.Unlock()
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated = "libvlc.PlayList.Operator_Subscript" )  Function Item(Index As Integer) As libvlc.Medium
		  ' Note: This method has been deprecated in favor of PlayList.Operator_Subscript.
		  ' Returns the Medium at index in the PlayList. If there is not item at index then
		  ' an OutOfBoundsException will be raised.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Item
		  
		  Return Operator_Subscript(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(Added() As FolderItem)
		  ' Appends media to the playlist from the specified array of FolderItem objects.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Load
		  
		  Dim m() As Medium
		  For i As Integer = 0 To UBound(Added)
		    m.Append(Added(i))
		  Next
		  If UBound(m) > -1 Then Load(m)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(Added() As libvlc.Medium)
		  ' Appends media to the playlist from the specified array of Medium objects.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Load
		  
		  Me.Lock()
		  Try
		    For i As Integer = 0 To UBound(Added)
		      If libvlc_media_list_add_media(mList, Added(i).Handle) <> 0 Then Raise New VLCException("Unable to load medium into the list")
		    Next
		  Finally
		    Me.Unlock()
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadM3U(M3U As FolderItem) As Integer
		  ' Appends media from the specified M3U playlist. Returns the number of
		  ' tracks that were added.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.LoadM3U
		  
		  Dim c As Integer
		  Dim bs As BinaryStream
		  Try
		    bs = BinaryStream.Open(M3U)
		    c = LoadM3U(bs)
		  Finally
		    If bs <> Nil Then bs.Close()
		  End Try
		  Return c
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadM3U(M3U As Readable) As Integer
		  ' Appends media from the specified M3U playlist. Returns the number of
		  ' tracks that were added.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.LoadM3U
		  
		  Dim m() As libvlc.Medium = libvlc.ReadM3U(M3U)
		  If UBound(m) > -1 Then Load(m)
		  Return UBound(m) + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Lock()
		  mLock.Signal()
		  If mList <> Nil Then libvlc_media_list_lock(mList)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherInstance As libvlc.PlayList) As Integer
		  ' Compares two PlayList references for equality. References are considered equal
		  ' if they refer to the same underlying libvlc handle.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Operator_Compare
		  
		  Dim i As Integer = Super.Operator_Compare(OtherInstance)
		  If i = 0 Then i = Sign(Integer(mList) - Integer(OtherInstance.mList))
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As libvlc.Medium()
		  ' Converts the PlayList to an array of Medium objects.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Operator_Convert
		  
		  If mList = Nil Then Raise New OutOfBoundsException
		  Dim m() As Medium
		  Me.Lock()
		  Try
		    Dim c As Integer = libvlc_media_list_count(mList)
		    For i As Integer = 0 To c - 1
		      Dim p As Ptr = libvlc_media_list_item_at_index(mList, i)
		      If p <> Nil Then m.Append(New MediumPtr(p, False))
		    Next
		  Finally
		    Me.Unlock()
		  End Try
		  
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromList() As libvlc.Medium)
		  ' Converts the PlayList from an array of Medium objects. The PlayList is emptied first.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Operator_Convert
		  
		  Operator_Redim(-1)
		  Me.Lock()
		  Try
		    For i As Integer = 0 To FromList.Ubound()
		      If libvlc_media_list_add_media(mList, FromList(i).Handle) <> 0 Then Raise New VLCException("Unable to add media to the media list.")
		    Next
		  Finally
		    Me.Unlock()
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Redim(NewBounds As Integer)
		  ' Truncates the PlayList to the NewBounds. This method cannot be used to enlarge the
		  ' PlayList, only to shorten it. Pass a NewBounds of -1 to empty the list.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Operator_Redim
		  
		  If mList = Nil Then Me.Constructor()
		  Dim c As Integer = Me.Count - 1
		  Me.Lock()
		  Try
		    For i As Integer = c DownTo NewBounds + 1
		      If libvlc_media_list_remove_index(mList, i) <> 0 Then Raise New VLCException("The media list does not contain an entry at that index.")
		    Next
		  Finally
		    Me.Unlock()
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subscript(Index As Integer) As libvlc.Medium
		  ' Gets the Medium at index in the PlayList. If there is not item at index
		  ' then an OutOfBoundsException will be raised.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Operator_Subscript
		  
		  If mList = Nil Then Raise New OutOfBoundsException
		  Dim ret As Medium
		  Me.Lock()
		  Try
		    Dim p As Ptr = libvlc_media_list_item_at_index(mList, Index)
		    If p <> Nil Then ret = New MediumPtr(p, False)
		  Finally
		    Me.Unlock()
		  End Try
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Subscript(Index As Integer, Assigns NewMedia As libvlc.Medium)
		  ' Sets the Medium at index in the PlayList. If there is not item at index then
		  ' an OutOfBoundsException will be raised.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Operator_Subscript
		  '
		  ' See:
		  '
		  
		  If mList = Nil Or Index < 0 Or Index > Count - 1 Then Raise New OutOfBoundsException
		  Me.Lock()
		  Try
		    If libvlc_media_list_remove_index(mList, Index) <> 0 Or libvlc_media_list_insert_media(mList, NewMedia.Handle, Index) <> 0 Then
		      Raise New VLCException("Unable to replace the medium at index.")
		    End If
		  Finally
		    Me.Unlock()
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pop() As libvlc.Medium
		  ' Removes the last Medium from the playlist and returns it. If the playlist is
		  ' empty then an OutOfBoundsException will be raised.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Pop
		  
		  If Me.Count = -1 Then Raise New OutOfBoundsException
		  Dim m As libvlc.Medium = Me.Operator_Subscript(Count - 1)
		  Me.Remove(Count - 1)
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  ' Removes the Medium at index from the PlayList. If there is not item at
		  ' index then an OutOfBoundsException will be raised.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Remove
		  
		  If mList = Nil Then Raise New OutOfBoundsException
		  Me.Lock()
		  Try
		    If libvlc_media_list_remove_index(mList, Index) <> 0 Then Raise New VLCException("The media list does not contain an entry at that index.")
		  Finally
		    Me.Unlock()
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(WriteTo As FolderItem, ListName As String = "")
		  ' Saves the current playlist as an M3U playlist. ListName is an optional name
		  ' for the list to be included in the M3U output.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Save
		  
		  Dim bs As BinaryStream
		  Try
		    bs = BinaryStream.Create(WriteTo)
		    Save(bs, ListName)
		  Finally
		    If bs <> Nil Then bs.Close()
		  End Try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(WriteTo As Writeable, ListName As String = "")
		  ' Saves the current playlist as an M3U playlist. ListName is an optional name
		  ' for the list to be included in the M3U output.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Save
		  
		  libvlc.WriteM3U(Me, WriteTo, ListName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Shuffle()
		  ' Sort the playlist randomly.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Shuffle
		  
		  Dim indices() As Integer
		  Dim count As Integer = Me.Count
		  For i As Integer = 0 To count - 1
		    indices.Append(i)
		  Next
		  indices.Shuffle()
		  SortWith(indices)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort()
		  ' Sort the playlist by title.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Sort
		  
		  Sort(MetaDataType.Title)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort(SortBy As libvlc.MetaDataType)
		  ' Sort the playlist according to the SortBy type (Artist, Album, etc.)
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Sort
		  
		  Dim names() As String
		  Dim c As Integer = Me.Count - 1
		  For i As Integer = 0 To c
		    Dim m As libvlc.Medium = Operator_Subscript(i)
		    Dim meta As New libvlc.Meta.MetaData(m)
		    names.Append(meta.Lookup(SortBy, ""))
		  Next
		  SortWith(names)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortWith(Sortable() As Integer)
		  ' The Sortable() parameter is an array if indices into the playlist. The first number
		  ' in the array is the new index for the first item in the play list, the second number
		  ' is the new index of the second item in the play list, and so on.
		  '
		  ' For example if the playlist has three items in it and Sortable() = Array(2, 1, 0)
		  ' that would swap the first and last items in the playlist (0->2; 1->1; 2->0)
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.SortWith
		  
		  Dim count As Integer = UBound(Sortable)
		  Me.Lock()
		  Try
		    For i As Integer = 0 To count
		      Dim p As Ptr = libvlc_media_list_item_at_index(mList, i)
		      If p = Nil Then Raise New NilObjectException
		      Call libvlc_media_list_insert_media(mList, p, Sortable(i))
		      Call libvlc_media_list_remove_index(mList, i)
		    Next
		  Finally
		    Me.Unlock()
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SortWith(Sortable() As String)
		  ' Sort Sortable() array and then sort the playlist in exactly the same way.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.SortWith
		  
		  Dim indices() As Integer
		  Dim count As Integer = Me.Count
		  For i As Integer = 0 To count - 1
		    indices.Append(i)
		  Next
		  Sortable.SortWith(indices)
		  SortWith(indices)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Unlock()
		  Try
		    If mList <> Nil Then libvlc_media_list_unlock(mList)
		  Finally
		    mLock.Release()
		  End Try
		End Sub
	#tag EndMethod


	#tag Note, Name = About this class
		This class represents an array of Medium objects (i.e., a list of media to be played in a particular order.)
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the number of media in the PlayList.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Count
			  
			  If mList = Nil Then Return -1
			  Dim ret As Integer
			  Me.Lock()
			  Try
			    ret = libvlc_media_list_count(mList)
			  Finally
			    Me.Unlock()
			  End Try
			  
			  Return ret
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the index of the currently playing media in the PlayList.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.CurrentIndex
			  
			  If mList = Nil Then Return -1
			  Dim item As libvlc.Medium = CurrentItem()
			  If item <> Nil Then Return IndexOf(item) Else Return -1
			End Get
		#tag EndGetter
		CurrentIndex As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the current Medium in the PlayList, or Nil if there is none.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.CurrentItem
			  
			  If mList = Nil Then Return Nil
			  ' I have never observed this function to return anything but nil.
			  ' In the event that it works in future libvlc releases we'll try
			  ' to use it because it's much more efficient than scanning the list.
			  Dim p As Ptr = libvlc_media_list_media(mList)
			  If p <> Nil Then
			    ' Holy crap it worked.
			    Return New MediumPtr(p, False) ' False: do not increment refcount
			  Else
			    ' It didn't work. Try the slow way.
			    Dim c As Integer = Count
			    Dim m As Medium
			    Me.Lock()
			    Try
			      For i As Integer = 0 To c - 1
			        p = libvlc_media_list_item_at_index(mList, i)
			        If p = Nil Then Continue
			        Dim state As PlayerState = libvlc_media_get_state(p)
			        If state = PlayerState.Playing Or state = PlayerState.Paused Then
			          m = New MediumPtr(p, False)
			          Exit For
			        End If
			        m = Nil
			      Next
			    Finally
			      Me.Unlock()
			    End Try
			    Return m
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the current Medium in the PlayList. The Medium must already exist in the list.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.CurrentItem
			  
			  Dim i As Integer = Me.IndexOf(value)
			  If i > -1 Then
			    ' Operator_Subscript calls Lock() which is contraindicated for
			    ' libvlc_media_list_set_media(). Hence we call it separately and
			    ' store the returned Medium in a local variable before the API call.
			    Dim m As libvlc.Medium = Operator_Subscript(i)
			    libvlc_media_list_set_media(mList, m.Handle)
			  Else
			    Raise New VLCException("That medium is not in the list.")
			  End If
			End Set
		#tag EndSetter
		CurrentItem As libvlc.Medium
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the VLC handle for the PlayList.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.Handle
			  
			  Return mList
			End Get
		#tag EndGetter
		Handle As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the overall length of the playlist, in milliseconds.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.LengthMS
			  
			  Dim ms As Int64
			  Dim c As Integer = Count
			  For i As Integer = 0 To c - 1
			    ms = ms + Operator_Subscript(i).DurationMS
			  Next
			  Return ms
			End Get
		#tag EndGetter
		LengthMS As Int64
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mList As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLock As Semaphore
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns True if the PlayList cannot be modified.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList.ReadOnly
			  
			  If mList <> Nil Then Return libvlc_media_list_is_readonly(mList)
			End Get
		#tag EndGetter
		ReadOnly As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the overall position within the playlist, in milliseconds. The return value is
			  ' the time up until the beginning of the currently playing item; add the TimeMS property
			  ' of the VLCPlayer that's playing the list to determine the exact TimeMS of the list.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.ListPlayer.TimeMS
			  
			  If Me.CurrentIndex = -1 Then Return 0
			  Dim ms As Int64
			  Dim c As Integer = Count
			  For i As Integer = 0 To c - 1
			    If i < CurrentIndex Then
			      ms = ms + Operator_Subscript(i).DurationMS
			    Else
			      Exit For
			    End If
			  Next
			  Return ms
			End Get
		#tag EndGetter
		TimeMS As Int64
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AppName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentIndex"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Logging"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserAgent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
