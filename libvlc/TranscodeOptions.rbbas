#tag Class
Protected Class TranscodeOptions
	#tag Method, Flags = &h0
		Sub SetDestination(Output As FolderItem)
		  OutputDestination = Output.AbsolutePath
		  If InStr(OutputDestination, " ") > 0 And Left(OutputDestination, 1) <> """" Then
		    OutputDestination = """" + OutputDestination + """"
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Dim audio(), video(), output() As String
		  If AudioBitrate > 0 Then audio.Append("ab=" + Format(AudioBitrate, "#####0"))
		  If AudioChannels > -1 Then audio.Append("channels=" + Format(AudioChannels, "#####0"))
		  If AudioCodec <> "" Then audio.Append("acodec=" + AudioCodec)
		  Select Case AudioSampleRate
		  Case 11250, 22500, 44100, 48000
		    audio.Append("samplerate=" + Format(AudioSampleRate, "#####0"))
		  End Select
		  
		  If VideoBitrate > 0 Then video.Append("vb=" + Format(VideoBitrate, "#####0"))
		  If VideoCodec <> "" Then video.Append("vcodec=" + VideoCodec)
		  If mVideoScaleModified Then video.Append("scale=" + Format(VideoScale, "0.0#####"))
		  If VideoDeinterlace Then video.Append("deinterlace")
		  
		  If OutputAccess <> "" Then output.Append("access=" + OutputAccess)
		  If OutputDestination <> "" Then output.Append("dst=" + OutputDestination)
		  If OutputMuxer <> "" Then output.Append("mux=" + OutputMuxer)
		  
		  Dim au As String
		  If audio.Ubound > -1 Then au = Join(audio, ",")
		  Dim vd As String
		  If video.Ubound > -1 Then vd = Join(video, ",")
		  If vd <> "" Then vd = vd + ","
		  
		  Return ":sout=#transcode{" + vd + au + "}:std{" + Join(output, ",") + "}"
		End Function
	#tag EndMethod


	#tag Note, Name = vlc documentation
		
		https://wiki.videolan.org/Documentation:Streaming_HowTo/Advanced_Streaming_Using_the_Command_Line/
	#tag EndNote


	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-ab=<integer>
			Audio bitrate
			Target bitrate of the transcoded audio stream.
			
			This option allows to set the bitrate of the transcoded audio stream, in kbit/s. 
		#tag EndNote
		AudioBitrate As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-channels=<integer [0 .. 9]>
			Audio channels
			Number of audio channels in the transcoded streams.
			
			This option allows to set the number of channels of the resulting audio stream. This is useful 
			for codecs that don't have support for more than 2 channels, or to lower the bitrate of an audio
			stream. 
		#tag EndNote
		AudioChannels As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-acodec=<string>
			Destination audio codec
			This is the audio codec that will be used.
			
			This option allows you to specify the codec the audio tracks of the input stream should be transcoded to.
			
			List of available codecs can be found on the streaming features page.(https://www.videolan.org/streaming/features.html)
		#tag EndNote
		AudioCodec As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-aenc={any,jpeg,png,x264,x265,opus,g711,araw,theora,vorbis,twolame,schroedinger,substx3g,webvtt,speex,
			                       flac,t140,avcodec,lpcm,dvbsub,vpx,rtpvideo,dmo,edummy,stats,qsv,none}
			Audio encoder
			This is the audio encoder module that will be used (and its associated options).
			
			This allows to set the encoder to use to encode the audio stream. Available options are :
			
			   "ffmpeg": this is the libavcodec encoding module. It handles a large variety of different codecs (the list 
			             can be found on the streaming features page).
			   "vorbis": This module uses the vorbis encoder from the Xiph.org project. Vorbis is a free, open, license-free
			             lossy audio codec.
			   "speex": This module uses the speex encoder from the Xiph.org project. Speex is a lossy audio codec, best fit 
			            for very low bitrates (around 10 kbit/s) and particularly video conferences.
		#tag EndNote
		AudioEncoder As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-afilter=<string>
			Audio filter
			Audio filters will be applied to the audio streams (after conversion
			filters are applied). You can enter a colon-separated list of filters.
			
		#tag EndNote
		AudioFilters() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-alang=<string>
			Audio language
			This is the language of the audio stream.
		#tag EndNote
		AudioLanguage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-samplerate=<integer [0 .. 48000]>
			Audio sample rate
			Sample rate of the transcoded audio stream (11250, 22500, 44100 or 48000).
			
			This option allows to set the sample rate of the transcoded audio stream, in Hz. Reducing the 
			sample rate is a way to lower the bitrate of the resulting audio stream. 
		#tag EndNote
		AudioSampleRate As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoScale As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoScaleModified As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-standard-access=<string>
			Output access method
			Output method to use for the stream.
			
			This option allows to set the medium used to save or send the stream. This is a compulsory option. 
			
			Available options are :
			
			   "file": saves the stream to a file.
			         Use "file{append}" to append the stream to an existing file instead of replacing it :
			
			   "udp": streams to a UDP unicast or multicast address.
			   "http": streams over HTTP.
			   "https": streams over HTTP, using a secured SSL/TLS connection.
			   "mmsh": streams using the Microsoft MMS protocol. This protocol is used as transport method by many
			           Microsoft applications. Note that only a small part of the MMS protocol is supported (MMS 
			           encapsulated in HTTP).
			   "shout": sends the stream to a Shoutcast (or Icecast) server.
			
		#tag EndNote
		OutputAccess As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-standard-dst=<string>
			Output destination
			Destination (URL) to use for the stream. Overrides path and bind
			parameters
			
			This option allows to give various information about the location where the stream should actually be saved or sent.
			
			If the "file" OutputAccess is used, this is the path where the file should be saved.
			If the "udp" or "rtp" OutputAccess is used, this is the unicast or multicast destination address and, optionally, UDP port
			in the form address:port. If the "http", "https" or "mmsh" OutputAccess is chosen, this is the address, port and path of 
			the local network interface on which the server should listen for requests. If no address is given, VLC will listen on all the 
			network interfaces. These bits of information have to be supplied using the address:port/path syntax.
			
		#tag EndNote
		OutputDestination As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-standard-mux=<string>
			Output muxer
			Muxer to use for the stream.
			
			This option allows you to set the encapsulation method used for the resulting stream. This option has to be set.
			
			Available options are :
			
			ts: the MPEG-TS muxer. This the standard muxer used to stream MPEG-2. This muxer can be used with any access method. 
			    Supported codecs are MPEG 1/2/4, MJPEG, H263, H264, I263, WMV 1/2 and Theora for video, MPEG audio, AAC and a52 
			    for the audio stream.
			ps: the MPEG-PS muxer. This the standard muxer for MPEG 2 files (.mpg). It can be used with the file and http output
			    methods. Supported codecs are MPEG 1/2 and MJPEG for video, MPEG audio and a52 for audio streams.
			mpeg1: the standard MPEG 1 muxer. This muxer should be used instead of ps with MPEG 1 video streams, when saved to a
			    file or streamed over HTTP. Supported codecs are MPEG 1 and MPEG audio. (same as for the PS muxer)
			ogg: the ogg muxer. This is the muxer from the Xiph project. It can be used with the HTTP and file output methods. 
			     Supported codecs are MPEG 1/2/4, MJPEG WMV 1/2 and Theora, audio streams can be vorbis, flac, speex, a52 or MPEG
			     audio.
			asf: the Microsoft ASF muxer. This is the standard muxer used for streaming by Microsoft applications. Is also used as
			     container for WMA audio files. This muxer can be used with the file and HTTP output methods. Supported codecs are
			     MPEG-4, MJPEG, WMV 1/2 for video, MPEG audio, and a52 for audio streams.
			asfh: this is a special version of the ASF muxer, that should be used for MMSH streaming. MMSH is the only supported 
			      output method. Supported codecs are the same as for ASF.
			avi: the Microsoft AVI muxer. This is very common encapsulation format for MPEG-4 files. The only supported output 
			     method is file. Supported codecs are MPEG 1/2/4, H263, H264 and I263 for video, MPEG audio and a52 for audio streams.
			     Note: The avi muxer in VLC is known to produce corrupt files.
			
			mpjpeg: the multipart jpeg muxer. This encapsulation format is mostly used on surveillance video cameras with an integrated
			        web server. Such streams are usually embedded in web pages and seen with standard Internet browsers, as they are 
			        seen as a succession of jpeg images. The only supported output method is HTTP. The only usable codec is MJPEG. No 
			        sound track can be muxed in such streams.
		#tag EndNote
		OutputMuxer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-scodec=<string>
			Destination subtitle codec
			This is the subtitle codec that will be used.
			
		#tag EndNote
		SubtitleCodec As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-senc={any,jpeg,png,x264,x265,opus,g711,araw,theora,vorbis,twolame,schroedinger,substx3g,webvtt,speex,flac,
			                       t140,avcodec,lpcm,dvbsub,vpx,rtpvideo,dmo,edummy,stats,qsv,none}
			Subtitle encoder
			This is the subtitle encoder module that will be used (and its associated options).
			
		#tag EndNote
		SubtitleEncoder As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-soverlay, --no-sout-transcode-soverlay
			(default disabled)
			
		#tag EndNote
		SubtitleOverlay As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-threads=<integer>
			Number of threads
			Number of threads used for the transcoding.
			
			
			This option allows to set the number of computer processing threads 
			that should be used to encode the streams. Increasing this number to the 
			amount of processors on the computer (or twice this number on Intel P4 HT processors) 
			should improve transcoding performance. 
		#tag EndNote
		ThreadCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-vb=<integer>
			Video bitrate
			Target bitrate of the transcoded video stream.
			
			This option allows to set the bitrate of the transcoded video stream, in kbit/s. 
		#tag EndNote
		VideoBitrate As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-vcodec=<string>
			Destination video codec
			This is the video codec that will be used.
			
			This option allows to specify the codec the video tracks of the input stream should be transcoded to.
			
			List of available codecs can be found on the streaming features page (https://www.videolan.org/streaming/features.html)
		#tag EndNote
		VideoCodec As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-deinterlace, --no-sout-transcode-deinterlace
			Deinterlace video
			(default disabled)
			
			This option allows to enable deinterlacing of interlaced video streams before encoding. 
		#tag EndNote
		VideoDeinterlace As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-deinterlace-module={deinterlace,ffmpeg-deinterlace}
			Deinterlace module
			Specify the deinterlace module to use.
			
		#tag EndNote
		VideoDeinterlaceModule As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-venc={any,jpeg,png,x264,x265,opus,g711,araw,theora,vorbis,twolame,schroedinger,substx3g,webvtt,
			                       speex,flac,t140,avcodec,lpcm,dvbsub,vpx,rtpvideo,dmo,edummy,stats,qsv,none}
			
			Video encoder
			This is the video encoder module that will be used (and its associated options).
			
			This allows to set the encoder to use to encode the videos stream. Available options are:
			
			   "ffmpeg": this is the libavcodec encoding module. It handles a large variety of different codecs 
			             (the list can be found on the streaming features page.
			   "theora": The Xiph.org Theora encoder. The module is used to produce theora streams. Theora is a 
			             free patent and royalties-free video codec.
			   "x264":   x264 is a free open-source h264 encoder. h264 (or MPEG4-AVC) is a recent high-quality 
			             video codec.
			
		#tag EndNote
		VideoEncoder As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-vfilter=<string>
			Video filter
			Video filters will be applied to the video streams (after overlays
			are applied). You can enter a colon-separated list of filters.
		#tag EndNote
		VideoFilters() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-fps=<string>
			Video frame-rate
			Target output frame rate for the video stream.
			
			This option allows to set the framerate of the transcoded video, in frames per second; reducing 
			the framerate of a video can help decrease its bitrate. 
		#tag EndNote
		VideoFrameRate As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-height=<integer>
			Video height
			Output video height.
			
			This option allows you to give the height of the transcoded video, in pixels. 
		#tag EndNote
		VideoHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-maxheight=<integer>
			Maximum video height
			Maximum output video height.
		#tag EndNote
		VideoMaxHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-maxwidth=<integer>
			Maximum video width
			Maximum output video width.
		#tag EndNote
		VideoMaxWidth As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			--sout-transcode-scale=<float [-340282346638528859811704183484516925440.000000 .. 340282346638528859811704183484516925440.000000]>
			Video scaling
			Scale factor to apply to the video while transcoding (eg: 0.25)
			
			This option allows the give the ratio from which the video should be rescaled while being
			transcoded. This option can be particularly useful to help reduce the bitrate of a stream. 
		#tag EndNote
		#tag Getter
			Get
			  return mVideoScale
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mVideoScale = value
			  mVideoScaleModified = True
			End Set
		#tag EndSetter
		VideoScale As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-width=<integer>
			Video width
			Output video width.
			
			This option allows you to give the width of the transcoded video, in pixels. 
		#tag EndNote
		VideoWidth As Integer
	#tag EndProperty


	#tag Constant, Name = AUDIO_BITRATE_HIGH, Type = Double, Dynamic = False, Default = \"256", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AUDIO_BITRATE_HIGHEST, Type = Double, Dynamic = False, Default = \"320", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AUDIO_BITRATE_MEDIUM, Type = Double, Dynamic = False, Default = \"192", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AUDIO_BITRATE_STANDARD, Type = Double, Dynamic = False, Default = \"128", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AudioBitrate"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AudioChannels"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AudioCodec"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AudioEncoder"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AudioLanguage"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AudioSampleRate"
			Group="Behavior"
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubtitleCodec"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubtitleEncoder"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubtitleOverlay"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadCount"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoBitrate"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoCodec"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoDeinterlace"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoDeinterlaceModule"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoEncoder"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoFrameRate"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoHeight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoMaxHeight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoMaxWidth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoScale"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoWidth"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
