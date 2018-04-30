#tag Class
Private Class MemoryFile
	#tag Method, Flags = &h0
		Sub Constructor(Owner As libvlc.Medium, Stream As Readable, Length As UInt64)
		  If Streams = Nil Then Streams = New Dictionary
		  mOpaque = NewOpaque()
		  Streams.Value(mOpaque) = Stream:Length
		  mHandle = libvlc_media_new_callbacks(Owner.Instance, AddressOf MediaOpen, AddressOf MediaRead, AddressOf MediaSeek, AddressOf MediaClose, mOpaque)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub MediaClose(Opaque As Ptr)
		  System.DebugLog(CurrentMethodName + "(" + Str(Integer(Opaque)) + ")")
		  If Streams.HasKey(Opaque) Then Streams.Remove(Opaque)
		  If Streams.Count = 0 Then Streams = Nil
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub MediaCloseCallback(Opaque As Ptr)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function MediaOpen(Opaque As Ptr, UserData As Ptr, ByRef StreamLen As UInt64) As Int32
		  System.DebugLog(CurrentMethodName + "(" + Str(Integer(Opaque)) + ", " + Hex(Integer(UserData)) + ", " + Str(StreamLen) + ")")
		  Dim p As Pair = Streams.Lookup(Opaque, Nil)
		  If p = Nil Then Return 1 ' invalid Opaque
		  StreamLen = p.Right
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function MediaOpenCallback(Opaque As Ptr, UserData As Ptr, ByRef StreamLen As UInt64) As Int32
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function MediaRead(Opaque As Ptr, Buffer As Ptr, BufferSize As Int64) As UInt64
		  System.DebugLog(CurrentMethodName + "(" + Str(Integer(Opaque)) + ", " + Hex(Integer(Buffer)) + ", " + Str(BufferSize) + ")")
		  Dim p As Pair = Streams.Lookup(Opaque, Nil)
		  If p = Nil Then Return 0 ' invalid Opaque
		  Dim r As Readable = p.Left
		  Dim mb As MemoryBlock = Buffer
		  Dim data As MemoryBlock = r.Read(BufferSize)
		  mb.StringValue(0, data.Size) = data
		  System.DebugLog(CurrentMethodName + ": Returned " + Str(data.size) + " bytes")
		  Return data.Size
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function MediaReadCallback(Opaque As Ptr, Buffer As Ptr, BufferSize As UInt64) As UInt64
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Shared Function MediaSeek(Opaque As Ptr, Offset As UInt64) As Int32
		  System.DebugLog(CurrentMethodName)
		  Dim p As Pair = Streams.Lookup(Opaque, Nil)
		  If p = Nil Then Return 1 ' invalid Opaque
		  Dim r As Readable = p.Left
		  If Not (r IsA BinaryStream) Then Return 2 ' not seekable
		  If Offset > BinaryStream(r).Length Then Return 3 ' invalid offset
		  BinaryStream(r).Position = Offset
		  Return 0
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function MediaSeekCallback(Opaque As Ptr, Offset As UInt64) As Int32
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function MediumHandle() As Ptr
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function NewOpaque() As Ptr
		  Static Opaque As Integer = 777
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
		Private mOpaque As Ptr
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
