#tag Class
Private Class PlayListPtr
Inherits libvlc.PlayLists.PlayList
	#tag Method, Flags = &h1000
		Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  // Calling the overridden superclass constructor.
		  // Constructor(FromPtr As Ptr, AddRef As Boolean) -- From PlayList
		  Super.Constructor(FromPtr, AddRef)
		End Sub
	#tag EndMethod


End Class
#tag EndClass
