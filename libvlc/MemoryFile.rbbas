#tag Class
Private Class MemoryFile
	#tag Method, Flags = &h0
		Sub Constructor(Owner As libvlc.Medium, ByRef Stream As MemoryBlock)
		  If Not System.IsFunctionAvailable("libvlc_media_new_callbacks", VLCLib) Then
		    Raise New VLCException("Loading media from memory is not available in the installed version of libvlc.")
		  End If
		  
		  If Streams = Nil Then Streams = New Dictionary
		  Dim opaque As Ptr = NewOpaque()
		  Streams.Value(opaque) = Stream
		  mHandle = libvlc_media_new_callbacks(Owner.Instance, AddressOf MediaOpen, AddressOf MediaRead, AddressOf MediaSeek, AddressOf MediaClose, opaque)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Owner As libvlc.Medium, Stream As Readable)
		  If Not System.IsFunctionAvailable("libvlc_media_new_callbacks", VLCLib) Then
		    Raise New VLCException("Loading media from memory is not available in the installed version of libvlc.")
		  End If
		  
		  If Streams = Nil Then Streams = New Dictionary
		  Static Opaque As Integer
		  Do
		    Opaque = Opaque + 1
		  Loop Until Not Streams.HasKey(Opaque)
		  Streams.Value(opaque) = Stream
		  mHandle = libvlc_media_new_callbacks(Owner.Instance, Nil, AddressOf MediaRead, AddressOf MediaSeek, AddressOf MediaClose, opaque)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub MediaClose(Opaque As Integer)
		  #pragma X86CallingConvention CDecl
		  #pragma BoundsChecking Off
		  #pragma BackgroundTasks Off
		  #pragma StackOverflowChecking Off
		  #pragma NilObjectChecking Off
		  
		  If Streams.HasKey(Opaque) Then Streams.Remove(Opaque)
		  If Streams.Count = 0 Then Streams = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MediaOpen(Opaque As Integer, Buffer As Ptr, ByRef BufferSize As UInt64) As UInt32
		  #pragma X86CallingConvention CDecl
		  #pragma BoundsChecking Off
		  #pragma BackgroundTasks Off
		  #pragma StackOverflowChecking Off
		  #pragma NilObjectChecking Off
		  
		  System.DebugLog(CurrentMethodName + "(0x" + Hex(Opaque) + ", " + Hex(Integer(Buffer)) + ", " + Format(BufferSize, "+-##########0") + ")")
		  
		  Dim mb As MemoryBlock = Streams.Lookup(Opaque, Nil)
		  If mb = Nil Then Return 1 ' invalid Opaque
		  System.DebugLog(CurrentMethodName + " found stream")
		  Buffer = Nil
		  BufferSize = mb.Size
		  System.DebugLog(CurrentMethodName + " set size to " + Format(BufferSize, "#######0") + " bytes")
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MediaRead(Opaque As Integer, Buffer As Ptr, BufferSize As Integer) As UInt32
		  #pragma X86CallingConvention CDecl
		  #pragma BoundsChecking Off
		  #pragma BackgroundTasks Off
		  #pragma StackOverflowChecking Off
		  #pragma NilObjectChecking Off
		  
		  System.DebugLog(CurrentMethodName + "(0x" + Hex(Opaque) + ", " + Hex(Integer(Buffer)) + ", " + Format(BufferSize, "+-##########0") + ")")
		  
		  Dim r As Readable = Streams.Lookup(Opaque, Nil)
		  If r = Nil Then Return 0 ' invalid Opaque
		  System.DebugLog(CurrentMethodName + " found stream")
		  Dim mb As MemoryBlock = Buffer
		  Dim data As MemoryBlock = r.Read(BufferSize)
		  mb.StringValue(0, data.Size) = data
		  System.DebugLog(CurrentMethodName + " copied " + Format(data.Size, "#######0") + " bytes")
		  Return data.Size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MediaSeek(Opaque As Integer, Offset As UInt64) As Int32
		  #pragma X86CallingConvention CDecl
		  #pragma BoundsChecking Off
		  #pragma BackgroundTasks Off
		  #pragma StackOverflowChecking Off
		  #pragma NilObjectChecking Off
		  
		  Dim r As Readable = Streams.Lookup(Opaque, Nil)
		  If r = Nil Then Return 0 ' invalid Opaque
		  If Not (r IsA BinaryStream) Then Return 2 ' not seekable
		  If Offset > BinaryStream(r).Length Then Return 3 ' invalid offset
		  BinaryStream(r).Position = Offset
		  Return 0
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mHandle As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Streams As Dictionary
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
