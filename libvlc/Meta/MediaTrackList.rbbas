#tag Class
Protected Class MediaTrackList
Inherits libvlc.Meta.LinkedList
	#tag Method, Flags = &h0
		Function AudioTrack(Index As Integer) As Ptr
		  If Me.Type(Index) = libvlc.TrackType.Audio Then Return Me.Item(Index).libvlc_media_track_t.TrackPtr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BitRate(Index As Integer) As UInt32
		  Return Me.Item(Index).libvlc_media_track_t.BitRate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Codec(Index As Integer) As UInt32
		  Return Me.Item(Index).libvlc_media_track_t.Codec
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Medium As libvlc.Medium)
		  If Not Medium.IsParsed Then Medium.Parse()
		  Dim p As Ptr
		  mCount = libvlc_media_tracks_get(Medium.Handle, p)
		  // Calling the overridden superclass constructor.
		  // Constructor(ListPtr As Ptr, StructSize As Integer) -- From LinkedList
		  Super.Constructor(p, libvlc_media_track_t.Size)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Description(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_media_track_t.Description
		  If mb <> Nil Then Return mb.CString(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mList <> Nil Then libvlc_media_tracks_release(mList, mCount)
		  mList = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ID(Index As Integer) As Integer
		  Return Me.Item(Index).libvlc_media_track_t.ID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(TrackID As Integer) As Integer
		  ' Returns the index of the Track corresponding to TrackID, or -1
		  
		  Dim c As Integer = Me.Count
		  For i As Integer = 0 To c - 1
		    If Me.ID(i) = TrackID Then Return i
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Language(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_media_track_t.Language
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Level(Index As Integer) As Integer
		  Return Me.Item(Index).libvlc_media_track_t.Level
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OriginalFourCC(Index As Integer) As UInt32
		  Return Me.Item(Index).libvlc_media_track_t.OriginalFourCC
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Profile(Index As Integer) As Integer
		  Return Me.Item(Index).libvlc_media_track_t.Profile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type(Index As Integer) As libvlc.TrackType
		  Return libvlc.TrackType(Me.Item(Index).libvlc_media_track_t.Type)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoTrack(Index As Integer) As Ptr
		  If Me.Type(Index) = libvlc.TrackType.Video Then Return Me.Item(Index).libvlc_media_track_t.TrackPtr
		End Function
	#tag EndMethod


	#tag Note, Name = About this class
		This class represents an array of VLC elementary stream description structures (libvlc_media_track_t)
		for a given instance of Medium (i.e. one media file or URL)
		
		https://www.videolan.org/developers/vlc/doc/doxygen/html/structlibvlc__media__track__t.html
	#tag EndNote


	#tag Property, Flags = &h1
		Protected mCount As UInt32
	#tag EndProperty


	#tag ViewBehavior
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
	#tag EndViewBehavior
End Class
#tag EndClass
