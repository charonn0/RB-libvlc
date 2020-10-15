#tag Class
Private Class PlayListPtr
Inherits libvlc.PlayLists.PlayList
	#tag Method, Flags = &h1000
		Sub Constructor(FromPtr As Ptr)
		  // Calling the overridden superclass constructor.
		  // Constructor(CommandLine As String) -- From VLCInstance
		  Super.Constructor(DEFAULT_ARGS)
		  mList = FromPtr
		End Sub
	#tag EndMethod


End Class
#tag EndClass
