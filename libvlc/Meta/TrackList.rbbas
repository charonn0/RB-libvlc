#tag Class
Protected Class TrackList
Inherits libvlc.Meta.LinkedList
	#tag Method, Flags = &h1000
		Sub Constructor(ListPtr As Ptr)
		  // Calling the overridden superclass constructor.
		  // Constructor(ListPtr As Ptr, StructSize As Integer) -- From LinkedList
		  Super.Constructor(ListPtr, libvlc_track_description_t.Size)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ID(Index As Integer) As Integer
		  Return Me.Item(Index).libvlc_track_description_t.ID
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
		Function Name(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_track_description_t.name
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod


	#tag Note, Name = libvlc_track_description_t
		This class wraps a pointer to a list of libvlc_track_description_t structures. The libvlc_track_description_t
		structure contains information about available video, audio and subtitle tracks for a media descriptor.
		
		https://www.videolan.org/developers/vlc/doc/doxygen/html/structlibvlc__track__description__t.html
	#tag EndNote


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
