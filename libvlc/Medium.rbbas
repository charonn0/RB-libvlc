#tag Class
Protected Class Medium
Inherits libvlc.VLCInstance
	#tag Method, Flags = &h0
		Sub AddOption(Options As String, Flags As UInt32 = 0)
		  ' Applies advanced reading/streaming options to a single Medium object
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

	#tag Method, Flags = &h1
		Protected Sub Constructor(FileDescriptor As Integer)
		  If FileDescriptor = 0 Then Raise New NilObjectException
		  Super.Constructor(DEFAULT_ARGS)
		  mMedium = libvlc_media_new_fd(Me.Instance, FileDescriptor)
		  If mMedium = Nil Then Raise New VLCException("Unable to create a media reference for the file descriptor.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(AddRef As libvlc.Medium)
		  ' Duplicates the Medium. The duplicate is independent of the original.
		  
		  Super.Constructor(AddRef)
		  libvlc_media_retain(AddRef.mMedium)
		  Me.Constructor(AddRef.mMedium)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(FromStream As Readable, Optional Length As UInt64)
		  Super.Constructor(DEFAULT_ARGS)
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
		Function DurationMS() As Int64
		  If Not Me.IsParsed Then Me.Parse()
		  If mMedium <> Nil Then Return libvlc_media_get_duration(mMedium)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FromMemoryBlock(ByRef Data As MemoryBlock) As libvlc.Medium
		  Dim m As New Medium(New BinaryStream(Data))
		  m.mMemoryData = Data
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetStats() As libvlc_media_stats_t
		  If mMedium <> Nil Then
		    Dim p As libvlc_media_stats_t
		    If libvlc_media_get_stats(mMedium, p) Then Return p
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mMedium
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsParsed() As Boolean
		  ' Returns True if the media's meta data has been parsed. Parsing is done when media are played;
		  ' call the Parse() method to read metadata without playing.
		  
		  If mMedium <> Nil Then Return libvlc_media_is_parsed(mMedium)
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

	#tag Method, Flags = &h0
		Function MediaFile() As FolderItem
		  Dim url As String = Me.MediaURL
		  If Left(url, 5) = "file:" Then Return GetFolderItem(url, FolderItem.PathTypeURL)
		  Select Case NthField(url, "://", 1)
		  Case "dvd", "dvdsimple", "vcd", "cdda"
		    Dim i As Integer = InStr(url, "://")
		    If i > 1 Then
		      Return GetFolderItem("file:/" + url.Right(url.Len - i), FolderItem.PathTypeURL)
		    End If
		  End Select
		End Function
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
		Function MediaURL() As String
		  ' Returns the Media Resource Locator ("MRL", AKA "URL") of the media. For media constructed from FolderItems, this is the URLPath.
		  
		  If mMedium <> Nil Then
		    Dim mb As MemoryBlock = libvlc_media_get_mrl(mMedium)
		    If mb <> Nil Then Return mb.CString(0)
		  End If
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
		  
		  Me.Operator_Convert(FromFolderItem.URLPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromPtr As Ptr)
		  ' Constructs an Instance of Medium using FromPtr without incrementing VLC's internal refcount for the Ptr.
		  ' This method assumes that the refcount was incremented when the Ptr was created so we don't need to do it again.
		  ' However, the refcount WILL be decremented by Medium.Destructor; refer to the specific VLC function docs to
		  ' determine whether this is appropriate.
		  
		  Super.Constructor(DEFAULT_ARGS)
		  mMedium = FromPtr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromURL As String)
		  ' Constructs a new Medium from the specified URL. The URL may refer to a local or network location, using any supported protocol.
		  
		  Super.Constructor(DEFAULT_ARGS)
		  mMedium = libvlc_media_new_location(Me.Instance, FromURL)
		  If mMedium = Nil Then Raise New UnsupportedFormatException
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse()
		  ' Parses the media's meta data without playing it. Parsing is done automatically when media are played; call the IsParsed() method to
		  ' determine whether the metadata has already been parsed. Refer to the MetaData class, and the VLCPlayer.MetaData method.
		  
		  If mMedium <> Nil Then libvlc_media_parse(mMedium)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrackList() As libvlc.Meta.MediaTrackList
		  ' Returns a TrackList object representing the tracks of the media (audio, video, subtitles, etc.)
		  
		  If mMedium <> Nil Then Return New libvlc.Meta.MediaTrackList(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type() As libvlc.MediaType
		  ' Returns a member of the libvlc.MediaType enum, representing the type of media being handled (file, disc, stream, etc.)
		  
		  If mMedium <> Nil Then Return libvlc_media_get_type(mMedium)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( deprecated = "libvlc.Medium.MediaURL" )  Function URL() As String
		  Return Me.MediaURL
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mMedium <> Nil Then Return libvlc_media_get_state(mMedium)
			End Get
		#tag EndGetter
		CurrentState As libvlc.PlayerState
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mMedium As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMemoryData As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Streams As Dictionary
	#tag EndProperty


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
