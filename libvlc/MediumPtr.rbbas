#tag Class
Private Class MediumPtr
Inherits libvlc.Medium
	#tag Method, Flags = &h1000
		Sub Constructor(FromPtr As Ptr)
		  ' Constructs an Instance of Medium using FromPtr without incrementing VLC's internal refcount for the Ptr.
		  ' This method assumes that the refcount was incremented when the Ptr was created so we don't need to do it again.
		  ' However, the refcount WILL be decremented by Medium.Destructor; refer to the specific VLC function docs to
		  ' determine whether this is appropriate.
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(CommandLine As String) -- From VLCInstance
		  Super.Constructor(DEFAULT_ARGS)
		  mMedium = FromPtr
		End Sub
	#tag EndMethod


End Class
#tag EndClass
