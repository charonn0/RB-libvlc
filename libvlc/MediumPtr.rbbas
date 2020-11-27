#tag Class
Private Class MediumPtr
Inherits libvlc.Medium
	#tag Method, Flags = &h1000
		Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  // Calling the overridden superclass constructor.
		  // Constructor(FromPtr As Ptr, AddRef As Boolean) -- From Medium
		  Super.Constructor(FromPtr, AddRef)
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
