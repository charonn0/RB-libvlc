#tag Class
Protected Class Medium
Inherits libvlc.VLCInstance
	#tag Method, Flags = &h0
		Sub AddOption(Options As String, Flags As UInt32 = 0)
		  ' Applies advanced reading/streaming options to a single Medium object.
		  ' The libvlc.TranscodeOptions class can be helpful in generating options; refer
		  ' to the comments in the TranscodeOptions class for additional help.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Medium.AddOption
		  ' https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media.html#ga39511e64baa7c1fdbf89eddc88bf9e15
		  ' https://www.videolan.org/developers/vlc/doc/doxygen/html/group__libvlc__media.html#ga96d5e0f418eecf74149057796160fd3a
		  ' 
		  If mMedium = Nil Then Return
		  If Flags = 0 Then
		    libvlc_media_add_option(mMedium, Options)
		  Else
		    libvlc_media_add_option_flag(mMedium, Options, Flags)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Artwork(Assigns ArtFile As FolderItem)
		  If ArtFile <> Nil And ArtFile.Exists And Not ArtFile.Directory Then
		    Dim tmp As Picture = Picture.Open(ArtFile)
		    If tmp <> Nil Then
		      ArtworkURL = ArtFile.URLPath
		      SaveMetaData()
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(FileDescriptor As Integer)
		  If FileDescriptor = 0 Then Raise New NilObjectException
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From VLCInstance
		  Super.Constructor()
		  mMedium = libvlc_media_new_fd(Me.Instance, FileDescriptor)
		  If mMedium = Nil Then Raise New VLCException("Unable to create a media reference for the file descriptor.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(AddRef As libvlc.Medium)
		  ' Duplicates AddRef by incrementing its internal refcount. The duplicate is independent of the original.
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(AddRef As VLCInstance) -- From VLCInstance
		  Super.Constructor(AddRef)
		  libvlc_media_retain(AddRef.mMedium)
		  mMedium = AddRef.mMedium
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  ' Constructs an instance of Medium using FromPtr. If AddRef is True then libvlc's internal reference count for the
		  ' FromPtr is incremented. The reference count will be decremented by Medium.Destructor; refer to the VLC documentation
		  ' for the function that gave you FromPtr to determine whether the reference count should be incremented.
		  
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From VLCInstance
		  Super.Constructor()
		  mMedium = FromPtr
		  If AddRef Then libvlc_media_retain(mMedium)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(FromStream As Readable, Optional Length As UInt64)
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From VLCInstance
		  Super.Constructor()
		  If Not System.IsFunctionAvailable("libvlc_media_new_callbacks", VLCLib) Then
		    Raise New VLCException("Loading media from memory is not available in the installed version of libvlc.")
		  End If
		  
		  If Streams = Nil Then Streams = New Dictionary
		  Static Opaque As Integer
		  Do
		    Opaque = Opaque + 1
		  Loop Until Not Streams.HasKey(Opaque)
		  If Length = 0 And FromStream IsA BinaryStream Then Length = BinaryStream(FromStream).Length
		  Streams.Value(opaque) = FromStream:Length
		  mMedium = libvlc_media_new_callbacks(Me.Instance, AddressOf MediaOpen, AddressOf MediaRead, AddressOf MediaSeek, AddressOf MediaClose, opaque)
		  If mMedium = Nil Then Raise New libvlc.VLCException("Unable to construct a Medium instance using callbacks.")
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mMedium <> Nil Then libvlc_media_release(mMedium)
		  mMedium = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FromMemoryBlock(ByRef Data As MemoryBlock) As libvlc.Medium
		  Dim m As New Medium(New BinaryStream(Data))
		  m.mMemoryData = Data
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub MediaClose(Opaque As Integer)
		  #pragma X86CallingConvention CDecl
		  #pragma BoundsChecking Off
		  #pragma BackgroundTasks Off
		  #pragma StackOverflowChecking Off
		  #pragma NilObjectChecking Off
		  
		  If Streams.HasKey(Opaque) Then
		    Dim r As Readable = Streams.Value(Opaque)
		    Streams.Remove(Opaque)
		    Select Case r
		    Case IsA BinaryStream
		      BinaryStream(r).Close
		    Case IsA TextInputStream
		      TextInputStream(r).Close
		    Case IsA TCPSocket
		      TCPSocket(r).Close
		    End Select
		  End If
		  If Streams.Count = 0 Then Streams = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MediaOpen(Opaque As Integer, ByRef OpaqueOut As Integer, ByRef BufferSize As UInt64) As UInt32
		  #pragma X86CallingConvention CDecl
		  #pragma BoundsChecking Off
		  #pragma BackgroundTasks Off
		  #pragma StackOverflowChecking Off
		  #pragma NilObjectChecking Off
		  
		  Dim p As Pair = Streams.Lookup(Opaque, Nil)
		  If p = Nil Then Return 1 ' invalid Opaque
		  Dim r As Readable = p.Left
		  Dim sz As UInt64 = p.Right
		  BufferSize = sz
		  Streams.Value(Opaque) = r
		  OpaqueOut = Opaque ' copy one argument to another...
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MediaRead(Opaque As Integer, Buffer As Ptr, BufferSize As Integer) As UInt32
		  #pragma X86CallingConvention CDecl
		  #pragma BoundsChecking Off
		  #pragma BackgroundTasks Off
		  #pragma StackOverflowChecking Off
		  #pragma NilObjectChecking Off
		  
		  Dim r As Readable = Streams.Lookup(Opaque, Nil)
		  If r = Nil Then Return 0 ' invalid Opaque
		  
		  Dim mb As MemoryBlock = Buffer
		  Dim data As MemoryBlock = r.Read(BufferSize)
		  mb.StringValue(0, data.Size) = data
		  Return data.Size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MediaSeek(Opaque As Integer, Offset As UInt64) As Int32
		  #pragma X86CallingConvention CDecl
		  #pragma BoundsChecking Off
		  #pragma BackgroundTasks Off
		  #pragma StackOverflowChecking Off
		  #pragma NilObjectChecking Off
		  
		  Dim r As Readable = Streams.Lookup(Opaque, Nil)
		  If r = Nil Then Return 0 ' invalid Opaque
		  If Not (r IsA BinaryStream) Then Return 2 ' not seekable
		  If Offset > BinaryStream(r).Length Then Return 3 ' invalid offset
		  BinaryStream(r).Position = Offset
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherInstance As libvlc.Medium) As Integer
		  Dim i As Integer = Super.Operator_Compare(OtherInstance)
		  If i = 0 Then i = Sign(Integer(mMedium) - Integer(OtherInstance.mMedium))
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromFolderItem As FolderItem)
		  ' Constructs a new Medium from the specified FolderItem. The FolderItem may be a file or a directory/disk drive.
		  If FromFolderItem = Nil Then
		    Dim err As New NilObjectException
		    err.Message = "FromFolderItem is Nil. Check for nil -before- trying to convert from an object type."
		    Raise err
		  End If
		  Me.Operator_Convert(FromFolderItem.URLPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromURL As String)
		  ' Constructs a new Medium from the specified URL. The URL may refer to a local or network location, using any supported protocol.
		  
		  If mMedium <> Nil Then
		    Me.Destructor()
		  Else
		    // Calling the superclass constructor.
		    // Constructor() -- From VLCInstance
		    Super.Constructor()
		  End If
		  mMedium = libvlc_media_new_location(Me.Instance, FromURL)
		  If mMedium = Nil Then Raise New UnsupportedFormatException
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse()
		  ' Parses the media's meta data without playing it. Parsing is done automatically when media are played; call the IsParsed() method to
		  ' determine whether the metadata has already been parsed. Refer to the MetaData class, and the VLCPlayer.MetaData method.
		  
		  If mMedium <> Nil Then libvlc_media_parse(mMedium)
		  mMeta = New libvlc.Meta.MetaData(Me)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveMetaData()
		  If mMeta <> Nil Then mMeta.Flush()
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Actors, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Actors) = value
			End Set
		#tag EndSetter
		Actors As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Album, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Album) = value
			End Set
		#tag EndSetter
		Album As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.AlbumArtist, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.AlbumArtist) = value
			End Set
		#tag EndSetter
		AlbumArtist As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		#tag Note
			Set this property to False to disallow fetching the album artwork from network locations.
			By default fetching is allowed unless specifically disallowed. 
			Change the FETCH_ARTWORK_FROM_NETWORK_DEFAULT constant to change the default behavior.
		#tag EndNote
		AllowFetchArtwork As Boolean = FETCH_ARTWORK_FROM_NETWORK_DEFAULT
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  If mMeta.HasKey(libvlc.MetaDataType.Artist) Then Return mMeta.Value(libvlc.MetaDataType.Artist)
			  Return AlbumArtist
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Artist) = value
			End Set
		#tag EndSetter
		Artist As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mArtwork <> Nil Then Return mArtwork
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Dim url As String = mMeta.Lookup(libvlc.MetaDataType.ArtworkURL, "")
			  If url <> "" Then
			    Dim data As MemoryBlock
			    Select Case NthField(url, "://", 1)
			    Case "http"
			      If Not AllowFetchArtwork Then Return Nil
			      Dim h As New HTTPSocket
			      data = h.Get(url, 10)
			      
			    Case "https"
			      If Not AllowFetchArtwork Then Return Nil
			      Dim h As New HTTPSecureSocket
			      data = h.Get(url, 10)
			      
			    Case "file"
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
			  Return mArtwork
			End Get
		#tag EndGetter
		Artwork As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.ArtworkURL, "")
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.ArtworkURL) = value
			End Set
		#tag EndSetter
		ArtworkURL As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Copyright, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Copyright) = value
			End Set
		#tag EndSetter
		Copyright As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMedium <> Nil Then Return libvlc_media_get_state(mMedium)
			End Get
		#tag EndGetter
		CurrentState As libvlc.PlayerState
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Date, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Date) = value
			End Set
		#tag EndSetter
		Date As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Description, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Description) = value
			End Set
		#tag EndSetter
		Description As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Director, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Director) = value
			End Set
		#tag EndSetter
		Director As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.DiscNumber, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.DiscNumber) = value
			End Set
		#tag EndSetter
		DiscNumber As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.DiscTotal, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.DiscTotal) = value
			End Set
		#tag EndSetter
		DiscTotal As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Not Me.IsParsed Then Me.Parse()
			  If mMedium <> Nil Then Return libvlc_media_get_duration(mMedium)
			End Get
		#tag EndGetter
		DurationMS As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.EncodedBy, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.EncodedBy) = value
			End Set
		#tag EndSetter
		EncodedBy As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Episode, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Episode) = value
			End Set
		#tag EndSetter
		Episode As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Genre, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Genre) = value
			End Set
		#tag EndSetter
		Genre As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mMedium
			End Get
		#tag EndGetter
		Handle As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns True if the medium's meta data has been parsed. Parsing is done when media are played;
			  ' call the Parse() method to read metadata without playing.
			  
			  If mMedium <> Nil Then Return libvlc_media_is_parsed(mMedium)
			End Get
		#tag EndGetter
		IsParsed As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Language, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Language) = value
			End Set
		#tag EndSetter
		Language As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mArtwork As Picture
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim url As String = Me.MediaURL
			  If Left(url, 5) = "file:" Then Return GetFolderItem(url, FolderItem.PathTypeURL)
			  Select Case NthField(url, "://", 1)
			  Case "dvd", "dvdsimple", "vcd", "cdda"
			    Dim i As Integer = InStr(url, "://")
			    If i > 1 Then
			      Return GetFolderItem("file:/" + url.Right(url.Len - i), FolderItem.PathTypeURL)
			    End If
			  End Select
			End Get
		#tag EndGetter
		MediaFile As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the Media Resource Locator ("MRL", AKA "URL") of the media. For media constructed from FolderItems, this is the URLPath.
			  
			  If mMedium <> Nil Then
			    Dim mb As MemoryBlock = libvlc_media_get_mrl(mMedium)
			    If mb <> Nil Then Return mb.CString(0)
			  End If
			End Get
		#tag EndGetter
		MediaURL As String
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mMedium As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMemoryData As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMeta As libvlc.Meta.MetaData
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSubItems As libvlc.PlayList
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Publisher, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Publisher) = value
			End Set
		#tag EndSetter
		Publisher As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Rating, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Rating) = value
			End Set
		#tag EndSetter
		Rating As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Season, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Season) = value
			End Set
		#tag EndSetter
		Season As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.Setting, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Setting) = value
			End Set
		#tag EndSetter
		Setting As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.ShowName, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.ShowName) = value
			End Set
		#tag EndSetter
		ShowName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mMedium <> Nil Then
			    Dim p As libvlc_media_stats_t
			    If libvlc_media_get_stats(mMedium, p) Then Return p
			  End If
			End Get
		#tag EndGetter
		Protected Statistics As libvlc_media_stats_t
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared Streams As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' A single Medium object can contain a PlayList. For example if the Medium is an audio
			  ' CD then its SubItems is a PlayList of the tracks on that CD. 
			  
			  If mSubItems = Nil And mMedium <> Nil Then
			    Dim p As New VLCPlayer(Me)
			    ' the subitems are populated when the Medium is played
			    If p.Play(True) Then p.Stop()
			    mSubItems = New PlayListPtr(Me)
			  End If
			  Return mSubItems
			End Get
		#tag EndGetter
		SubItems As libvlc.PlayList
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  If mMeta.HasKey(libvlc.MetaDataType.Title) Then Return mMeta.Value(libvlc.MetaDataType.Title)
			  Return MediaURL()
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.Title) = value
			End Set
		#tag EndSetter
		Title As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.TrackID, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.TrackID) = value
			End Set
		#tag EndSetter
		TrackID As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns a TrackList object representing the tracks of the media (audio, video, subtitles, etc.)
			  
			  If mMedium <> Nil Then Return New libvlc.Meta.MediaTrackList(Me)
			End Get
		#tag EndGetter
		TrackList As libvlc.Meta.MediaTrackList
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.TrackNumber, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.TrackNumber) = value
			End Set
		#tag EndSetter
		TrackNumber As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.TrackTotal, "")
			End Get
		#tag EndGetter
		TrackTotal As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns a member of the libvlc.MediaType enum, representing the type of media being handled (file, disc, stream, etc.)
			  
			  If mMedium <> Nil Then Return libvlc_media_get_type(mMedium)
			End Get
		#tag EndGetter
		Type As libvlc.MediaType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  Return mMeta.Lookup(libvlc.MetaDataType.URL, "")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mMeta = Nil Then mMeta = New libvlc.Meta.MetaData(Me)
			  mMeta.Value(libvlc.MetaDataType.URL) = value
			End Set
		#tag EndSetter
		URL As String
	#tag EndComputedProperty


	#tag Constant, Name = FETCH_ARTWORK_FROM_NETWORK_DEFAULT, Type = Boolean, Dynamic = False, Default = \"True", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AppName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libvlc.VLCInstance"
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
