#tag Class
Protected Class VLCInstance
	#tag Method, Flags = &h0
		Sub ClearErrorMsg()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  Me.Constructor(0, "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(argc As Integer, argv As String)
		  mHandle = libvlc_new(argc, argv)
		  
		  If mHandle = Nil Then 
		    mErrorMsg = libvlc.LastErrorMessage
		    Raise New libvlc.VLCException(Me)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorMsg() As String
		  Return mErrorMsg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetInstance() As libvlc.VLCInstance
		  If mInstance = Nil Then mInstance = New libvlc.VLCInstance()
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mHandle
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mErrorMsg As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared mInstance As libvlc.VLCInstance
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
