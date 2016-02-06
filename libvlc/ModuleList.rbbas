#tag Class
Protected Class ModuleList
	#tag Method, Flags = &h0
		Sub Constructor(ListPtr As Ptr)
		  mList = ListPtr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Dim p As Ptr = mList
		  Dim count As Integer
		  Do Until p = Nil
		    Dim pp As libvlc_module_description_t = p.libvlc_module_description_t(0)
		    p = p.Ptr(pp.Size)
		    count = count + 1
		  Loop
		  Return count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mList <> Nil Then libvlc_module_description_list_release(mList)
		  mList = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Help(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).psz_help
		  Return mb.CString(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Item(Index As Integer) As libvlc_module_description_t
		  Dim p As Ptr = mList
		  Dim count As Integer
		  Do Until p = Nil
		    Dim pp As libvlc_module_description_t = p.libvlc_module_description_t(0)
		    p = p.Ptr(pp.Size)
		    If count = Index Then Return pp
		    count = count + 1
		  Loop
		  
		  Raise New OutOfBoundsException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LongName(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).psz_longname
		  Return mb.CString(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).psz_name
		  Return mb.CString(0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShortName(Index As Integer) As String
		  Dim mb As MemoryBlock = Me.Item(Index).psz_shortname
		  Return mb.CString(0)
		  
		End Function
	#tag EndMethod


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
