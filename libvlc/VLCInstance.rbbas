#tag Class
Protected Class VLCInstance
	#tag Method, Flags = &h1
		Protected Sub Constructor(argc As Integer = DEFAULT_ARGC, argv As String = DEFAULT_ARGV)
		  If Not libvlc.IsAvailable Then Raise New PlatformNotSupportedException
		  
		  If Singleton = Nil Then 
		    mInstance = libvlc_new(argc, argv)
		    If argc = DEFAULT_ARGC And argv = DEFAULT_ARGV Then Singleton = Me
		    libvlc_log_set(mInstance, AddressOf LogCallback, mInstance)
		    RefCount = RefCount + 1
		    System.DebugLog(CurrentMethodName + ": " + Str(RefCount))
		  Else
		    Me.Constructor(Singleton)
		  End If
		  
		  If mInstance = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC instance.")
		  
		  mUserAgent = "RB-VLC/1.0"
		  Me.AppName = App.ExecutableFile.Name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(AddRef As VLCInstance)
		  libvlc_retain(AddRef.Instance)
		  mInstance = AddRef.Instance
		  libvlc_log_set(Me.Instance, AddressOf LogCallback, Me.Instance)
		  RefCount = RefCount + 1
		  System.DebugLog(CurrentMethodName + ": " + Str(RefCount))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mInstance <> Nil Then
		    If Me.Logging Then Me.Logging = False
		    libvlc_release(mInstance)
		    RefCount = RefCount - 1
		  End If
		  
		  mInstance = Nil
		  
		  If RefCount < 0 Then Break
		  System.DebugLog(CurrentMethodName + ": " + Str(RefCount))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorMsg() As String
		  Return mErrorMsg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Instance() As Ptr
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub LogCallback(UserData As Ptr, Level As Integer, Context As Ptr, Format As CString, Args As Ptr)
		  #pragma X86CallingConvention CDecl
		  #pragma Unused UserData
		  Dim mb As MemoryBlock = Args.Ptr(0)
		  'mInstance.VLCLog(Level, Context, Format, mb.CString(0))
		  #pragma Warning "Fix me"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherInstance As libvlc.VLCInstance) As Integer
		  If OtherInstance Is Nil Then Return 1
		  Return Sign(Integer(mInstance) - Integer(OtherInstance.mInstance))
		End Function
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
			  If mInstance <> Nil Then
			    libvlc_set_user_agent(mInstance, value, mUserAgent)
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
			    libvlc_log_set(mInstance, AddressOf LogCallback, Nil)
			  Else
			    libvlc_log_unset(mInstance)
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

	#tag Property, Flags = &h21
		Private mInstance As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLogging As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mSingleton As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserAgent As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared RefCount As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  If mSingleton <> Nil And mSingleton.Value <> Nil And mSingleton.Value IsA VLCInstance Then return VLCInstance(mSingleton.Value)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mSingleton = New WeakRef(value)
			End Set
		#tag EndSetter
		Private Shared Singleton As libvlc.VLCInstance
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUserAgent
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mInstance <> Nil Then
			    libvlc_set_user_agent(mInstance, mAppName, value)
			    mUserAgent = value
			  End If
			End Set
		#tag EndSetter
		UserAgent As String
	#tag EndComputedProperty


	#tag Constant, Name = DEFAULT_ARGC, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DEFAULT_ARGV, Type = String, Dynamic = False, Default = \"", Scope = Protected
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
			Name="Logging"
			Group="Behavior"
			Type="Boolean"
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
