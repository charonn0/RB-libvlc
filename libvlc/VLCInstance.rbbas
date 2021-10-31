#tag Class
Protected Class VLCInstance
	#tag Method, Flags = &h1
		Protected Sub Constructor()
		  ' Construct a new instance of libvlc and store it in Singleton, or increment
		  ' the refcount on the existing instance.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCInstance.Constructor
		  
		  If Not libvlc.IsAvailable Then
		    Dim err As New PlatformNotSupportedException
		    err.Message = "libvlc is not available."
		    ' We can't find the libvlc binary or one of its dependencies. Verify that all neccesary dll/solib/dylib
		    ' files are located in the expected directory for your environment. The easiest way to avoid this problem
		    ' is to add a build step to your project that copies the necessary files automatically.
		    ' See: http://docs.xojo.com/UserGuide:Build_Automation#Copy_Files
		    Raise err
		  End If
		  
		  ' Each 'instance' of libvlc can have any number of Medium, VLCPlayer, etc. objects associated with it. So
		  ' there's no reason for us to spin up more than one instance in our address space. The first subclass of
		  ' THIS class (VLCInstance) will spin up the instance, and subsequently created subclasses will use that
		  ' instance.
		  If Singleton <> Nil Then
		    Me.Constructor(Singleton)
		    mUserAgent = Singleton.UserAgent
		    mAppName = Singleton.AppName
		  Else
		    mInstance = libvlc_new(0, Nil)
		    If mInstance = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC instance.")
		    mUserAgent = "RB-libvlc/1.0"
		    Me.AppName = App.ExecutableFile.Name
		    Singleton = Me
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(CommandLine As String)
		  ' This Constructor is deprecated; do not use.
		  
		  If Not libvlc.IsAvailable Then Raise New PlatformNotSupportedException
		  If CommandLine = DEFAULT_ARGS And Singleton <> Nil Then
		    Me.Constructor(Singleton)
		  Else
		    Dim cmds() As String = SplitQuoted(CommandLine)
		    Dim argc As Integer = UBound(cmds) + 1
		    #If Target32Bit Then
		      Dim argv As New MemoryBlock((argc + 1) * 4)
		    #Else
		      Dim argv As New MemoryBlock((argc + 1) * 8)
		    #EndIf
		    Dim ptrs() As MemoryBlock
		    For i As Integer = 0 To argc - 1
		      Dim mb As MemoryBlock = cmds(i).Trim + Chr(0)
		      ptrs.Append(mb)
		      #If Target32Bit Then
		        argv.Ptr(i * 4) = mb
		      #Else
		        argv.Ptr(i * 8) = mb
		      #EndIf
		    Next
		    
		    mInstance = libvlc_new(argc, argv)
		    If mInstance = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC instance.")
		    If CommandLine = DEFAULT_ARGS Then Singleton = Me
		  End If
		  mUserAgent = "RB-VLC/1.0"
		  Me.AppName = App.ExecutableFile.Name
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(AddRef As VLCInstance)
		  ' Increments the refcount of the instance represented by AddRef. Subclasses that
		  ' provide a Constructor(VLCInstance) method must also call this Constructor with
		  ' the same parameter.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCInstance.Constructor
		  
		  libvlc_retain(AddRef.Instance)
		  mInstance = AddRef.Instance
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mInstance <> Nil Then libvlc_release(mInstance)
		  mInstance = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherInstance As libvlc.VLCInstance) As Integer
		  ' Compares two VLCInstance references for equality. References are considered equal
		  ' if they refer to the same underlying libvlc handle.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCInstance.Operator_Compare
		  
		  If OtherInstance Is Nil Then Return 1
		  Return Sign(Integer(mInstance) - Integer(OtherInstance.mInstance))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the human-readable name of the application.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCInstance.AppName
			  
			  return mAppName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the human-readable name of the application.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCInstance.AppName
			  
			  If mInstance <> Nil Then
			    libvlc_set_user_agent(mInstance, value, mUserAgent)
			    mAppName = value
			  End If
			End Set
		#tag EndSetter
		AppName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Return mInstance
			End Get
		#tag EndGetter
		Protected Instance As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAppName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInstance As Ptr
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
			  ' Gets the HTTP user-agent string of the application.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCInstance.UserAgent
			  
			  return mUserAgent
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the HTTP user-agent string of the application.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCInstance.UserAgent
			  
			  If mInstance <> Nil Then
			    libvlc_set_user_agent(mInstance, mAppName, value)
			    mUserAgent = value
			  End If
			End Set
		#tag EndSetter
		UserAgent As String
	#tag EndComputedProperty


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
