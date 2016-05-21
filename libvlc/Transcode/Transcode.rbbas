#tag Module
Protected Module Transcode
	#tag Method, Flags = &h1
		Protected Function CreateVideoTranscoder(Source As FolderItem, Destination As FolderItem) As libvlc.VLCPlayer
		  Dim acodec, vcodec, mux As String
		  acodec = SelectAudioCodec(Destination.Name)
		  vcodec = SelectVideoCodec(Destination.Name)
		  If vcodec <> "" Then
		    mux = SelectMuxer(SelectVideoCodec(Source.Name), vcodec)
		  ElseIf acodec <> "" Then
		    mux = SelectMuxer(SelectAudioCodec(Source.Name), acodec)
		  Else
		    Return Nil
		  End If
		  
		  Dim topts As New TranscodeOptions
		  If acodec <> "" Then opts.AddOption("transcode", "acodec", acodec)
		  If vcodec <> "" Then opts.AddOption("transcode", "vcodec", vcodec)
		  opts.AddOption("transcode", "mux", mux)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SelectAudioCodec(FileName As String) As String
		  Select Case NthField(FileName, ".", CountFields(FileName, "."))
		  Case "mpg"
		    Return "mpga" ' MPEG audio
		  Case "mp3"
		    Return "mp3" ' MPEG-3
		  Case "mp4"
		    Return "mp4a" ' MP4 audio
		  Case "wmv"
		    Return "MWV2" ' windows media 2
		  Case "ogg"
		    Return "vorb" ' ogg/vorbis
		  Case "flac"
		    Return "flac" ' flac
		  Else
		    Return ""
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SelectMuxer(SourceCodec As String, DestinationCodec As String, DestinationIsFile As Boolean) As String
		  Select Case DestinationCodec
		  Case "mp1v", "mpga", "mp2v"
		    Return "mpeg1"
		  Case "DVDv"
		    Return "ts"
		  Case "mp4a", "mpv4"
		    Return "mp4"
		  Case "mp3"
		    Return "dummy"
		  Case "vorb", "theora"
		    Return "ogg"
		  Else
		    Return ""
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SelectVideoCodec(FileName As String) As String
		  Select Case NthField(FileName, ".", CountFields(FileName, "."))
		  Case "mpg"
		    Return "mp1v" ' MPEG-1
		  Case "mp2"
		    Return "mp2v" ' MPEG-2
		  Case "mp4"
		    Return "mpv4" ' MPEG-4
		  Case "vob"
		    Return "DVDv" ' DVD
		  Case "wmv"
		    Return "MWV2" ' windows media 2
		  Case "ogg"
		    Return "theora" ' ogg/theora
		  Case "rm"
		    Return "RV10" ' Realmedia
		  Case "flv"
		    Return "FLV1" ' flash
		  Else
		    Return ""
		  End Select
		End Function
	#tag EndMethod


End Module
#tag EndModule
