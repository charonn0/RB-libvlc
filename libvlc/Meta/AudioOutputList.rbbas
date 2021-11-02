#tag Class
Protected Class AudioOutputList
Inherits libvlc.Meta.LinkedList
	#tag Method, Flags = &h0
		Sub Constructor(ListPtr As Ptr)
		  // Calling the overridden superclass constructor.
		  // Constructor(ListPtr As Ptr, StructSize As Integer) -- From LinkedList
		  Super.Constructor(ListPtr, libvlc_audio_output_t.Size)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Description(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_audio_output_t.psz_description
		  If mb <> Nil Then Return mb.CString(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mList <> Nil Then libvlc_audio_output_list_release(mList)
		  mList = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_audio_output_t.psz_name
		  If mb <> Nil Then Return mb.CString(0)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = libvlc_audio_output_t
		This class wraps a pointer to a structure. The libvlc_audio_output_t
		structure contains information about an available audio output channel
		
		https://www.videolan.org/developers/vlc/doc/doxygen/html/structlibvlc__audio__output__t.html
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
