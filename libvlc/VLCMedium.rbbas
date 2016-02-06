#tag Class
Protected Class VLCMedium
	#tag Method, Flags = &h1
		Protected Sub Constructor(Medium As Ptr)
		  mMedium = Medium
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mMedium <> Nil Then libvlc_media_release(mMedium)
		  mMedium = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mMedium
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function LoadURL(URL As String) As libvlc.VLCMedium
		  Dim medium As Ptr = libvlc_media_new_location(libvlc.GetInstance.Handle, URL)
		  If medium <> Nil Then Return New libvlc.VLCMedium(medium)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mMedium As Ptr
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
