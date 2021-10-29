#tag Class
Private Class PlayListPtr
Inherits libvlc.PlayList
	#tag Method, Flags = &h1000
		Sub Constructor(FromMedium As libvlc.Medium)
		  // Calling the overridden superclass constructor.
		  // Constructor(FromMedium As libvlc.Medium) -- From PlayList
		  Super.Constructor(FromMedium)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  // Calling the overridden superclass constructor.
		  // Constructor(FromPtr As Ptr, AddRef As Boolean) -- From PlayList
		  Super.Constructor(FromPtr, AddRef)
		End Sub
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
