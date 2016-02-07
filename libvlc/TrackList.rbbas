#tag Class
Protected Class TrackList
	#tag Method, Flags = &h0
		Function AudioTrack(Index As Integer) As Ptr
		  If Me.Type(Index) = libvlc.TrackType.Audio Then Return Me.Item(Index).TrackPtr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BitRate(Index As Integer) As UInt32
		  Return Me.Item(Index).BitRate
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Codec(Index As Integer) As UInt32
		  Return Me.Item(Index).Codec
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Medium As VLCMedium)
		  If Not Medium.IsParsed Then Medium.Parse()
		  mCount = libvlc_media_tracks_get(Medium.Handle, mList)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return mCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Description(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).Language
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
		  Return Me.Item(Index).ID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Item(Index As Integer) As libvlc_media_track_t
		  Dim p As Ptr = mList
		  Dim count As Integer
		  Do Until p = Nil
		    Dim pp As libvlc_media_track_t = p.libvlc_media_track_t(0)
		    p = p.Ptr(pp.Size)
		    If count = Index Then Return pp
		    count = count + 1
		  Loop
		  
		  Raise New OutOfBoundsException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Language(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).Language
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Level(Index As Integer) As Integer
		  Return Me.Item(Index).Level
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OriginalFourCC(Index As Integer) As UInt32
		  Return Me.Item(Index).OriginalFourCC
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Profile(Index As Integer) As Integer
		  Return Me.Item(Index).Profile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type(Index As Integer) As libvlc.TrackType
		  Return libvlc.TrackType(Me.Item(Index).Type)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoTrack(Index As Integer) As Ptr
		  If Me.Type(Index) = libvlc.TrackType.Video Then Return Me.Item(Index).TrackPtr
		End Function
	#tag EndMethod


	#tag Note, Name = About this class
		This class represents an array of VLC elementary stream description structures for a given instance of VLCMedium
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected mCount As UInt32
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mList As Ptr
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
