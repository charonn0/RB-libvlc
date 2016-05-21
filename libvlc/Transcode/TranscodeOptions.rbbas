#tag Class
Protected Class TranscodeOptions
	#tag Method, Flags = &h0
		Sub AddOption(ModuleName As String, Option As String, Value As String, Optional Parameter As String)
		  Dim d As Dictionary = mModules.Lookup(ModuleName, New Dictionary)
		  If Parameter = "" Then
		    d.Value(Option) = Value
		  Else
		    d.Value(Option) = New Dictionary(Value:Parameter)
		  End If
		  mModules.Value(ModuleName) = d
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mModules = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetOption(ModuleName As String, Option As String) As String
		  Dim d As Dictionary = mModules.Lookup(ModuleName, Nil)
		  If d <> Nil Then Return d.Lookup(Option, "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveOption(ModuleName As String, Option As String)
		  Dim d As Dictionary = mModules.Lookup(ModuleName, Nil)
		  If d = Nil Then Return
		  d.Remove(Option)
		  If d.Count = 0 Then
		    mModules.Remove(ModuleName)
		  Else
		    mModules.Value(ModuleName) = d
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToCommandLine() As String
		  Dim mb As New MemoryBlock(0)
		  Dim bs As New BinaryStream(mb)
		  bs.Write(":sout=")
		  For j As Integer = 0 To mModules.Count - 1
		    Dim ModuleName As String = mModules.Key(j)
		    If j = 0 Then bs.Write("#")
		    bs.Write(ModuleName + "{")
		    Dim opt As Dictionary = mModules.Value(ModuleName)
		    For i As Integer = 0 To opt.Count - 1
		      Dim option As String = opt.Key(i)
		      If opt.Value(option) IsA Dictionary Then ' has params
		        Dim params As Dictionary = opt.Value(option)
		        bs.Write(option + "=" + params.Key(0) + "{" + params.Value(params.Key(0)) + "}")
		      Else
		        bs.Write(option + "=" + opt.Value(option))
		      End If
		      If i < opt.Count - 1 Then bs.Write(",")
		    Next
		    bs.Write("}")
		    If j < mModules.Count - 1 Then bs.Write(":")
		  Next
		  bs.Close
		  Return mb
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mModules As Dictionary
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
