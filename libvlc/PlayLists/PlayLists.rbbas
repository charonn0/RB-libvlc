#tag Module
Protected Module PlayLists
	#tag Method, Flags = &h1
		Protected Function Create(MediaFiles() As FolderItem) As libvlc.PlayLists.PlayList
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaFiles)
		    m.Append(MediaFiles(i))
		  Next
		  Return Create(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Create(Media() As libvlc.Medium) As libvlc.PlayLists.PlayList
		  Return Media
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Create(MediaURLs() As String) As libvlc.PlayLists.PlayList
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaURLs)
		    m.Append(MediaURLs(i))
		  Next
		  Return Create(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Play(MediaFiles() As FolderItem, Optional TruePlayer As libvlc.VLCPlayer) As libvlc.PlayLists.ListPlayer
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaFiles)
		    m.Append(MediaFiles(i))
		  Next
		  Return Play(m, TruePlayer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Play(Media() As libvlc.Medium, Optional TruePlayer As libvlc.VLCPlayer) As libvlc.PlayLists.ListPlayer
		  Dim play As New ListPlayer
		  If TruePlayer <> Nil Then play.TruePlayer = TruePlayer
		  play.PlayList = Media
		  Return play
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Play(MediaURLs() As String, Optional TruePlayer As libvlc.VLCPlayer) As libvlc.PlayLists.ListPlayer
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaURLs)
		    m.Append(MediaURLs(i))
		  Next
		  Return Play(m, TruePlayer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadLine(ReadFrom As Readable) As String
		  Const cr = 13 
		  Const lf = 10
		  Dim mb As New MemoryBlock(0)
		  Dim output As New BinaryStream(mb)
		  Dim lastchar As Integer
		  Do Until ReadFrom.EOF
		    Dim thischar As String = ReadFrom.Read(1)
		    If thischar = "" Then Exit Do
		    If Asc(thischar) = lf And lastchar = cr Then ' eol
		      output.Write(thischar)
		      Exit Do
		    Else
		      output.Write(thischar)
		      lastchar = Asc(thischar)
		    End If
		  Loop
		  output.Close
		  Return DefineEncoding(mb, Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ReadM3U(ReadFrom As FolderItem) As libvlc.Medium()
		  Dim bs As BinaryStream = BinaryStream.Open(ReadFrom)
		  Dim m() As libvlc.Medium = ReadM3U(bs)
		  bs.Close
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ReadM3U(ReadFrom As Readable) As libvlc.Medium()
		  Dim m() As libvlc.Medium
		  If ReadLine(ReadFrom).Trim <> "#EXTM3U" Then Return m
		  
		  Do Until ReadFrom.EOF
		    Dim line As String = ReadLine(ReadFrom).Trim
		    Select Case True
		    Case line = "", Left(line, 1) = "#"
		      Continue
		    Else
		      If InStr(line, "://") > 0 Then ' MRL
		        m.Append(line)
		      Else ' path
		        Dim f As FolderItem = GetFolderItem(line, FolderItem.PathTypeAbsolute)
		        If f = Nil Or Not f.Exists Then Continue
		        m.Append(f)
		      End If
		    End Select
		  Loop
		  
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteM3U(Media() As libvlc.Medium, WriteTo As FolderItem, ListName As String = "", Overwrite As Boolean = False)
		  Dim bs As BinaryStream = BinaryStream.Create(WriteTo, Overwrite)
		  WriteM3U(Media, bs, ListName)
		  bs.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub WriteM3U(Media() As libvlc.Medium, WriteTo As Writeable, ListName As String = "")
		  WriteTo.Write("#EXTM3U" + EndOfLine.Windows + EndOfLine.Windows)
		  
		  If ListName <> "" Then WriteTo.Write("#PLAYLIST:" + ListName + EndOfLine.Windows + EndOfLine.Windows)
		  
		  For i As Integer = 0 To UBound(Media)
		    Dim m As libvlc.Medium = Media(i)
		    WriteTo.Write("#EXTINF:" + Str(m.DurationMS / 1000, "###############0") + "," + m.Title + EndOfLine.Windows)
		    WriteTo.Write(m.MediaURL + EndOfLine.Windows + EndOfLine.Windows)
		  Next
		  
		  
		End Sub
	#tag EndMethod


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
