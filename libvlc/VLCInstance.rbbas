#tag Class
Private Class VLCInstance
	#tag Method, Flags = &h21
		Private Sub Constructor()
		  Me.Constructor(DEFAULT_ARGC, DEFAULT_ARGV)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(argc As Integer, argv As String)
		  If Not libvlc.IsAvailable Then Raise New PlatformNotSupportedException
		  
		  mHandle = libvlc_new(argc, argv)
		  
		  If mHandle = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC instance.")
		  
		  mUserAgent = "RB-VLC/1.0"
		  Me.AppName = App.ExecutableFile.Name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(AddRef As VLCInstance)
		  libvlc_retain(AddRef.mHandle)
		  mHandle = AddRef.mHandle
		  libvlc_log_set(mHandle, AddressOf LogCallback, mHandle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mHandle <> Nil Then 
		    If Me.Logging Then Me.Logging = False
		    libvlc_release(mHandle)
		  End If
		  mHandle = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorMsg() As String
		  Return mErrorMsg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetInstance() As VLCInstance
		  If mInstance = Nil Then 
		    mInstance = New VLCInstance
		    If mInstance = Nil Then Break
		  End If
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub LogCallback(UserData As Ptr, Level As Integer, Context As Ptr, Format As CString, Args As Ptr)
		  #pragma X86CallingConvention CDecl
		  #pragma Unused UserData
		  Dim mb As MemoryBlock = Args.Ptr(0)
		  mInstance.VLCLog(Level, Context, Format, mb.CString(0))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub VLCLog(Level As Integer, Context As Ptr, Format As String, Args As String)
		  RaiseEvent VLCLog(Level, Context, Format, Args)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event VLCLog(Level As Integer, Context As Ptr, Format As String, Args As String)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAppName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mHandle <> Nil Then
			    libvlc_set_user_agent(mHandle, value, mUserAgent)
			    mAppName = value
			  End If
			End Set
		#tag EndSetter
		AppName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLogging
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    libvlc_log_set(mHandle, AddressOf LogCallback, Nil)
			  Else
			    libvlc_log_unset(mHandle)
			  End If
			  
			  mLogging = value
			End Set
		#tag EndSetter
		Logging As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAppName As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mErrorMsg As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mInstance As VLCInstance
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLogging As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserAgent As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUserAgent
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mHandle <> Nil Then
			    libvlc_set_user_agent(mHandle, mAppName, value)
			    mUserAgent = value
			  End If
			End Set
		#tag EndSetter
		UserAgent As String
	#tag EndComputedProperty


	#tag Constant, Name = DEFAULT_ARGC, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DEFAULT_ARGV, Type = String, Dynamic = False, Default = \"", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AppName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="UserAgent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
