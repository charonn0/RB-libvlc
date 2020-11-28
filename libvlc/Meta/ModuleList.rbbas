#tag Class
Protected Class ModuleList
Inherits libvlc.Meta.LinkedList
	#tag Method, Flags = &h0
		Sub Constructor(ListPtr As Ptr, Instance As libvlc.VLCInstance)
		  // Calling the overridden superclass constructor.
		  // Constructor(ListPtr As Ptr, StructSize As Integer) -- From LinkedList
		  Super.Constructor(ListPtr, libvlc_module_description_t.Size)
		  mInstance = Instance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mList <> Nil Then libvlc_module_description_list_release(mList)
		  mList = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Help(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_module_description_t.psz_help
		  If mb <> Nil Then Return mb.CString(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongName(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_module_description_t.psz_longname
		  If mb <> Nil Then Return mb.CString(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_module_description_t.psz_name
		  If mb <> Nil Then Return mb.CString(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShortName(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).libvlc_module_description_t.psz_shortname
		  If mb <> Nil Then Return mb.CString(0)
		  
		End Function
	#tag EndMethod


	#tag Note, Name = libvlc_module_description_t
		This class wraps a pointer to a  structure. The libvlc_module_description_t
		structure contains information about available audio and video output filters
		
		https://www.videolan.org/developers/vlc/doc/doxygen/html/structlibvlc__module__description__t.html
	#tag EndNote


	#tag Property, Flags = &h21
		Private mInstance As libvlc.VLCInstance
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
