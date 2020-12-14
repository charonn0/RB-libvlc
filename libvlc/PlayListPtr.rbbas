#tag Class
Private Class PlayListPtr
Inherits libvlc.PlayLists.PlayList
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


End Class
#tag EndClass
