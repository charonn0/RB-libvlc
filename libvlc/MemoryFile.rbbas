#tag Class
Private Class MemoryFile
	#tag Method, Flags = &h0
		Sub Constructor(Owner As libvlc.Medium, Stream As Readable)
		  If Not System.IsFunctionAvailable("libvlc_media_new_callbacks", VLCLib) Then
		    Raise New VLCException("Loading media from memory is not available in the installed version of libvlc.")
		  End If
		  
		  If Streams = Nil Then Streams = New Dictionary
		  Dim opaque As Ptr = NewOpaque()
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
		Private Shared Sub MediaClose(Opaque As Ptr)
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
		Private Shared Function MediaRead(Opaque As Ptr, Buffer As Ptr, BufferSize As Integer) As UInt32
		  #pragma X86CallingConvention CDecl
		  #pragma BoundsChecking Off
		  #pragma BackgroundTasks Off
		  #pragma StackOverflowChecking Off
		  #pragma NilObjectChecking Off
		  
		  Dim r As Readable = Streams.Lookup(Opaque, Nil)
		  If r = Nil Then Return 0 ' invalid Opaque
		  Dim mb As MemoryBlock = Buffer
		  Dim data As MemoryBlock = r.Read(BufferSize)
		  mb.StringValue(0, data.Size) = data
		  Return data.Size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function MediaSeek(Opaque As Ptr, Offset As UInt64) As Int32
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

	#tag Method, Flags = &h21
		Private Shared Function NewOpaque() As Ptr
		  Static Opaque As Integer
		  Do
		    opaque = opaque + 1
		  Loop Until Not Streams.HasKey(Ptr(opaque))
		  Return Ptr(opaque)
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
