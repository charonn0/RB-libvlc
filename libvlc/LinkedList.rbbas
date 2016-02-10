#tag Class
Protected Class LinkedList
	#tag Method, Flags = &h1
		Protected Sub Constructor(ListPtr As Ptr, StructSize As Integer)
		  mList = ListPtr
		  mStructSize = StructSize
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Dim p As Ptr = mList
		  Dim count As Integer
		  Do Until p = Nil
		    p = p.Ptr(mStructSize)
		    count = count + 1
		  Loop
		  Return count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Index As Integer) As Ptr
		  Dim p As Ptr = mList
		  Dim count As Integer
		  Do Until p = Nil
		    If count = Index Then Return p
		    p = p.Ptr(mStructSize)
		    count = count + 1
		  Loop
		  
		  Raise New OutOfBoundsException
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mList As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStructSize As Integer
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
