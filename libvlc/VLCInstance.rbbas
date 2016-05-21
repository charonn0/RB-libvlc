#tag Class
Protected Class VLCInstance
	#tag Method, Flags = &h1
		Protected Sub Constructor(argc As Integer = DEFAULT_ARGC, argv As String = DEFAULT_ARGV)
		  If Not libvlc.IsAvailable Then Raise New PlatformNotSupportedException
		  If Singleton <> Nil Then
		    Me.Constructor(Singleton)
		  Else
		    mInstance = libvlc_new(argc, argv)
		    If Singleton = Nil Then Singleton = Me
		  End If
		  If mInstance = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC instance.")
		  Me.Logging = DebugBuild
		  mUserAgent = "RB-VLC/1.0"
		  Me.AppName = App.ExecutableFile.Name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(AddRef As VLCInstance)
		  libvlc_retain(AddRef.Instance)
		  mInstance = AddRef.Instance
		  'Me.Logging = DebugBuild
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mInstance <> Nil Then
		    'Me.Logging = False
		    libvlc_release(mInstance)
		  End If
		  mInstance = Nil
		  
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
		  
		  Dim vlc As WeakRef = mInstances.Lookup(UserData, Nil)
		  If vlc <> Nil And vlc.Value <> Nil And vlc.Value IsA VLCInstance Then
		    Dim mb As MemoryBlock = Args
		    VLCInstance(vlc.Value).VLCLog(Level, Context, Format, mb.CString(0))
		    Return
		  End If
		  
		  #If TargetWin32 Then
		    Declare Function sprintf Lib "msvcrt" (Char As Ptr, Frmt As CString, Arg As Ptr) As Integer
		    Dim buffer As New MemoryBlock(1024)
		    Call sprintf(buffer, Format, Args)
		    System.DebugLog(buffer.CString(0))
		  #endif
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
		  #pragma BreakOnExceptions Off
		  Try
		    RaiseEvent VLCLog(Level, Context, Format, Args)
		  Catch
		    System.DebugLog("Post-mortem debug message: " + Format)
		  End Try
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
			  If mInstances = Nil Then mInstances = New Dictionary
			  If value Then
			    libvlc_log_set(mInstance, AddressOf LogCallback, mInstance)
			    mInstances.Value(mInstance) = New WeakRef(Me)
			  Else
			    libvlc_log_unset(mInstance)
			    If mInstances.HasKey(mInstance) Then mInstances.Remove(mInstance)
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
		Private Shared mInstances As Dictionary
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
