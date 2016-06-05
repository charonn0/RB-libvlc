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
		  Dim play As New PlayList
		  For i As Integer = 0 To UBound(Media)
		    play.Append(Media(i))
		  Next
		  Return play
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
		Protected Function Play(MediaFiles() As FolderItem) As libvlc.PlayLists.ListPlayer
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaFiles)
		    m.Append(MediaFiles(i))
		  Next
		  Return Play(m)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Play(Media() As libvlc.Medium) As libvlc.PlayLists.ListPlayer
		  Dim play As New ListPlayer
		  Dim list As New PlayList
		  For i As Integer = 0 To UBound(Media)
		    list.Append(Media(i))
		  Next
		  play.PlayList = list
		  Return play
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Play(MediaURLs() As String) As libvlc.PlayLists.ListPlayer
		  Dim m() As libvlc.Medium
		  For i As Integer = 0 To UBound(MediaURLs)
		    m.Append(MediaURLs(i))
		  Next
		  Return Play(m)
		End Function
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
