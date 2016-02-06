#tag Module
Protected Module libvlc
	#tag Method, Flags = &h1
		Protected Function GetInstance() As libvlc.VLCInstance
		  Return libvlc.VLCInstance.GetInstance()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LastErrorMessage() As String
		  Dim mb As MemoryBlock = libvlc_errmsg()
		  If mb <> Nil Then Return mb.CString(0)
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function libvlc_errmsg Lib "libvlc" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function libvlc_media_new_location Lib "libvlc" (Instance As Ptr, MediaURL As CString) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function libvlc_media_player_is_playing Lib "libvlc" (Player As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function libvlc_media_player_new_from_media Lib "libvlc" (Media As Ptr) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function libvlc_media_player_play Lib "libvlc" (Player As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_hwnd Lib "libvlc" (Player As Ptr, HWND As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_nsobject Lib "libvlc" (Player As Ptr, NSObject As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Sub libvlc_media_player_set_pause Lib "libvlc" (Player As Ptr, DoPause As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Sub libvlc_media_player_set_position Lib "libvlc" (Player As Ptr, Percent As Double)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub libvlc_media_player_set_xwindow Lib "libvlc" (Player As Ptr, XID As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Sub libvlc_media_player_stop Lib "libvlc" (Player As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Sub libvlc_media_release Lib "libvlc" (Medium As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Declare Function libvlc_new Lib "libvlc" (argc As Integer, argv As CString) As Ptr
	#tag EndExternalMethod


	#tag Structure, Name = libvlc_module_description_t, Flags = &h21
		psz_name As Ptr
		  psz_shortname As Ptr
		  psz_longname As Ptr
		psz_help As Ptr
	#tag EndStructure


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
End Module
#tag EndModule
