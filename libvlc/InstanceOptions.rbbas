#tag Class
Protected Class InstanceOptions
	#tag Method, Flags = &h0
		Sub AddOption(Option As String, Optional Value As String)
		  mOptions.Value(Option) = Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mOptions = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  Return mOptions.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetOption(Option As String) As String
		  Return mOptions.Lookup(Option, "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasOption(Option As String) As Boolean
		  Return mOptions.HasKey(Option)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromCommandLine As String)
		  Me.Constructor()
		  Dim args() As String
		  Dim input As New BinaryStream(FromCommandLine)
		  Dim tmp As String
		  Dim squote, dquote As Boolean
		  Do Until input.EOF
		    Dim char As String = input.Read(1)
		    Select Case char
		    Case " "
		      If squote Or dquote Then
		        tmp = tmp + char
		      Else
		        args.Append(tmp)
		        tmp = ""
		      End If
		      
		    Case """"
		      dquote = Not dquote
		      
		    Case "'"
		      squote = Not squote
		      
		    Else
		      tmp = tmp + char
		    End Select
		  Loop
		  If tmp.Trim <> "" Then args.Append(tmp)
		  input.Close
		  
		  For i As Integer = 0 To UBound(args)
		    Dim option As String = args(i)
		    Me.AddOption(option)
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveOption(Option As String)
		  If mOptions.HasKey(Option) Then mOptions.Remove(Option)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToCommandLine() As String
		  Dim mb As New MemoryBlock(0)
		  Dim bs As New BinaryStream(mb)
		  For i As Integer = 0 To mOptions.Count - 1
		    Dim option As String = mOptions.Key(i)
		    If mOptions.Value(option) <> "" Then ' has params
		      bs.Write(option + " " + mOptions.Value(option))
		    Else
		      bs.Write(option)
		    End If
		    If i <> 0 And i <> mOptions.Count - 1 Then bs.Write(" ")
		  Next
		  bs.Close
		  Return mb
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mOptions As Dictionary
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
