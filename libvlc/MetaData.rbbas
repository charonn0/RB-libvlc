#tag Class
Protected Class MetaData
	#tag Method, Flags = &h0
		Sub Constructor(Owner As VLCMedium)
		  mOwner = Owner
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Flush()
		  If Not libvlc_media_save_meta(Owner.Handle) Then Raise New VLCException("Unable to flush metadata changes to the media.")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasKey(Type As libvlc.MetaDataType) As Boolean
		  Return Lookup(Type, "") <> ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(Type As libvlc.MetaDataType, DefaultValue As String) As String
		  Dim mb As MemoryBlock = libvlc_media_get_meta(Owner.Handle, Type)
		  If mb <> Nil Then Return mb.CString(0)
		  Return DefaultValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Owner() As VLCMedium
		  Return mOwner
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Type As libvlc.MetaDataType) As String
		  Dim mb As MemoryBlock = libvlc_media_get_meta(Owner.Handle, Type)
		  If mb = Nil Then Raise New VLCException("The media does not contain meta data of the specified type.")
		  Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Type As libvlc.MetaDataType, Assigns NewValue As String)
		  libvlc_media_set_meta(Owner.Handle, Type, NewValue)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mOwner As VLCMedium
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