#tag Class
Protected Class AudioOutputList
Inherits libvlc.LinkedList
	#tag Method, Flags = &h0
		Sub Constructor(ListPtr As Ptr)
		  Super.Constructor(ListPtr, libvlc_audio_output_t.Size)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Description(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_audio_output_t(0).psz_description
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
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_audio_output_t(0).psz_name
		  If mb <> Nil Then Return mb.CString(0)
		  
		End Function
	#tag EndMethod


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
