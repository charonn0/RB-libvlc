#tag Class
Protected Class TranscodeOptions
	#tag Method, Flags = &h21
		Private Function Audio_ToString() As String
		  Dim audio() As String
		  If AudioBitrate > 0 Then audio.Append("ab=" + Format(AudioBitrate, "#####0"))
		  If AudioChannels > -1 Then audio.Append("channels=" + Format(AudioChannels, "#####0"))
		  If AudioCodec <> "" Then audio.Append("acodec=" + AudioCodec)
		  Select Case AudioSampleRate
		  Case 11250, 22500, 44100, 48000
		    audio.Append("samplerate=" + Format(AudioSampleRate, "#####0"))
		  End Select
		  If AudioEncoder <> "" Then audio.Append("aenc=" + AudioEncoder)
		  If AudioSampleRate > 0 Then audio.Append("samplerate=" + Format(AudioSampleRate, "#####0"))
		  
		  If audio.Ubound > -1 Then Return Join(audio, ",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Duplicate_ToString() As String
		  Dim dup() As String
		  If DuplicateDestination <> "" Then dup.Append("dst=" + DuplicateDestination)
		  If DuplicateSelect <> "" Then dup.Append("select=""" + DuplicateSelect + """")
		  
		  If dup.Ubound > -1 Then Return ":#duplicate{" + Join(dup, ",") + "}"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ElementaryStream_ToString() As String
		  Dim es() As String
		  If ElementaryStreamAccessVideo <> "" Then es.Append("access-video=" + ElementaryStreamAccessVideo)
		  If ElementaryStreamAccessAudio <> "" Then es.Append("access-audio=" + ElementaryStreamAccessAudio)
		  If ElementaryStreamAccess <> "" Then es.Append("access=" + ElementaryStreamAccess)
		  If ElementaryStreamVideoMuxer <> "" Then es.Append("mux-video=" + ElementaryStreamVideoMuxer)
		  If ElementaryStreamAudioMuxer <> "" Then es.Append("mux-audio=" + ElementaryStreamAudioMuxer)
		  If ElementaryStreamMuxer <> "" Then es.Append("mux-audio=" + ElementaryStreamMuxer)
		  If ElementaryStreamVideoDestination <> "" Then es.Append("dst-video=" + ElementaryStreamVideoDestination)
		  If ElementaryStreamAudioDestination <> "" Then es.Append("dst-audio=" + ElementaryStreamAudioDestination)
		  If ElementaryStreamDestination <> "" Then es.Append("dst=" + ElementaryStreamDestination)
		  
		  If es.Ubound > -1 Then Return ":#es{" + Join(es, ",") + "}"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Output_ToString() As String
		  Dim output() As String
		  If OutputAccess <> "" Then output.Append("access=" + OutputAccess)
		  If OutputDestination <> "" Then output.Append("dst=" + OutputDestination)
		  If OutputMuxer <> "" Then output.Append("mux=" + OutputMuxer)
		  If SubtitleOverlay Then output.Append("soverlay")
		  If SubtitleEncoder <> "" Then output.Append("senc=" + SubtitleEncoder)
		  If SubtitleCodec <> "" Then output.Append("scodec=" + SubtitleCodec)
		  
		  If output.Ubound > -1 Then Return ":std{" + Join(output, ",") + "}"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDestination(Output As FolderItem)
		  OutputDestination = Output.AbsolutePath_
		  If InStr(OutputDestination, " ") > 0 And Left(OutputDestination, 1) <> """" Then
		    OutputDestination = DefineEncoding("""" + OutputDestination + """", Encodings.UTF8)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString() As String
		  Dim audio As String = Audio_ToString()
		  Dim video As String = Video_ToString()
		  If video <> "" Then video = video + ","
		  Dim output As String = Output_ToString()
		  Dim dupe As String = Duplicate_ToString()
		  Dim es As String = ElementaryStream_ToString()
		  
		  Dim cmd As String = ":sout="
		  If audio <> "" And video <> "" Then
		    cmd = ":sout=#transcode{" + video + "," + audio + "}"
		  ElseIf video <> "" Then
		    cmd = ":sout=#transcode{" + video + "}"
		  ElseIf audio <> "" then
		    cmd = ":sout=#transcode{" + audio + "}"
		  End If
		  If dupe <> "" Then cmd = cmd + dupe
		  If es <> "" Then cmd = cmd + es
		  If output <> "" Then cmd = cmd + output
		  Return cmd
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Video_ToString() As String
		  Dim video() As String
		  If VideoBitrate > 0 Then video.Append("vb=" + Format(VideoBitrate, "#####0"))
		  If VideoCodec <> "" Then video.Append("vcodec=" + VideoCodec)
		  If mVideoScaleModified Then video.Append("scale=" + Format(VideoScale, "0.0#####"))
		  If VideoDeinterlace Then video.Append("deinterlace")
		  If VideoEncoder <> "" Then video.Append("venc=" + VideoEncoder)
		  If VideoFrameRate > 0 Then video.Append("fps=" + Format(VideoFrameRate, "#####0"))
		  If VideoWidth > 0 Then video.Append("width=" + Format(VideoWidth, "#####0"))
		  If VideoHeight > 0 Then video.Append("height=" + Format(VideoHeight, "#####0"))
		  If ThreadCount > 0 Then video.Append("threads=" + Format(ThreadCount, "#####0"))
		  
		  If video.Ubound > -1 Then Return Join(video, ",")
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

	#tag Property, Flags = &h0
		#tag Note
			This option allows to give the chain through which the duplicated stream should be processed.
			Note destination options have to be used in the same duplicate block to actually duplicate the stream.
			
			Possible values and item options are the same as those for the OutputDestination option.
		#tag EndNote
		DuplicateDestination As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This options can be used to duplicate only some of the elementary streams of a complete stream.
			
			Several criteria can be given, by separating each of them with a comma.
			For criteria that need a parameter, such as 'es' and 'program', you can also specify a range, using
			the syntax 'criteria=num_start-num_end'
			
			Available parameters are :
			
			program=: duplicate only elementary streams belonging to the selected program (or SID). This option
			only works with MPEG-TS streams.
			
			noprogram=: do not duplicate elementary streams belonging to the selected program (or PID). This option
			only works with MPEG-TS streams.
			
			es=: duplicate only the elementary stream with the selected id.
			
			noes=: do not duplicate the elementary stream with the selected id.
			
			video: duplicate only video elementary streams.
			
			novideo: do not duplicate video elementary streams.
			
			audio: duplicate only audio elementary streams.
			
			noaudio: do not duplicate audio elementary streams.
			
			spu: duplicate only subtitle elementary streams.
			
			nospu: do not duplicate subtitle elementary streams.
			
			Example :  "program=100-200,novideo"
			This duplicate chain will only output the non-video elementary streams belonging to the programs which PID
			are between 100 and 200.
		#tag EndNote
		DuplicateSelect As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This option can be used instead of both ElementaryStreamAccessVideo and ElementaryStreamAccessAudio options,
			when they share the same setting.
		#tag EndNote
		ElementaryStreamAccess As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Use this option to set the medium used to save or send the audio elementary streams. Possible values
			and item options are the same as those for the OutputAccess option.
		#tag EndNote
		ElementaryStreamAccessAudio As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Use this option to set the medium used to save or send the video elementary streams. Possible values
			and item options are the same as those for the OutputAccess option.
		#tag EndNote
		ElementaryStreamAccessVideo As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Use this option to set the location where the audio elementary streams should be saved, sent, or made available.
			The exact meaning of this option depends on the value of the ElementaryStreamAccessAudio option and is the same
			as for the OutputDestination option.
			
			Note: If you use the %n string in this field, VLC will replace it by the number of the audio or video track
			considered. The %c string will be replaced by the name (FourCC) of the codec of the track. %a prints the access
			output used and %m the muxer used.
		#tag EndNote
		ElementaryStreamAudioDestination As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Use this option to set the encapsulation method used for the audio elementary streams. Possible values
			and item options are the same as those for the OutputMuxer option.
		#tag EndNote
		ElementaryStreamAudioMuxer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This option can be used instead of both ElementaryStreamVideoDestination and ElementaryStreamAudioDestination options,
			when they share the same setting.
		#tag EndNote
		ElementaryStreamDestination As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This option can be used instead of both ElementaryStreamVideoMuxer and ElementaryStreamAudioMuxer-audio options,
			when they share the same setting.
		#tag EndNote
		ElementaryStreamMuxer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Use this option to set the location where the video elementary streams should be saved, sent, or made available.
			The exact meaning of this option depends on the value of the ElementaryStreamAccessVideo option and is the same
			as for the OutputDestination option.
			
			Note: If you use the %n string in this field, VLC will replace it by the number of the audio or video track
			considered. The %c string will be replaced by the name (FourCC) of the codec of the track. %a prints the access
			output used and %m the muxer used.
		#tag EndNote
		ElementaryStreamVideoDestination As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Use this option to set the encapsulation method used for the video elementary streams. Possible values
			and item options are the same as those for the OutputMuxer option.
		#tag EndNote
		ElementaryStreamVideoMuxer As String
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
			You can use this option to introduce a delay in the display of the stream. Delay has to be given in ms (milliseconds).
		#tag EndNote
		OutputDelay As Integer
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
			--audio, --no-audio        Enable audio
			(default enabled)
			You can completely disable the audio output. The audio decoding stage
			will not take place, thus saving some processing power.
		#tag EndNote
		OutputNoAudio As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--video, --no-video        Enable video
			(default enabled)
			You can completely disable the video output. The video decoding stage
			will not take place, thus saving some processing power.
		#tag EndNote
		OutputNoVideo As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-standard-sap, --no-sout-standard-sap
			SAP announcing
			(default disabled)
			
			Use this option if you want VLC to send SAP (Session Announcement Protocol) announces.
			SAP is a service discovery protocol, that uses a special multicast address to send a
			list of available streams on a server.
			
			This option can only be enabled with the udp OutputAccess method.
		#tag EndNote
		OutputSAP As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This option allows to specify the name of an optional group of streams. A VLC used as
			a client will use this field to classify the stream.
			
			This option uses a private extension of the SAP protocol. VLC will be the only client
			able to read this field.
			
			This option can only be used if the OutputSAP option has been enabled.
		#tag EndNote
		OutputSAPGroup As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Use this option if you want the SAP announces to be sent using the IPv6 protocol instead of IPv4.
			
			This option can only be used if the OutputSAP option has been enabled.
		#tag EndNote
		OutputSAPIPv6 As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-standard-name=<string>
			Session name
			This is the name of the session that will be announced in the SDP
			(Session Descriptor).
			
			
			Use this option to specify the name of the stream that will be sent in SAP and SLP announcements.
			
			This option can only be used if the OutputSAP or OutputSLP option has been enabled.
		#tag EndNote
		OutputSAPName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			SLP stands for Service Location Protocol. It is an alternative to SAP for session announcement.
			Use this option if you want to send such announcements.
		#tag EndNote
		OutputSLP As Boolean
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
			
			
			This allows to set the converter to use to encode the subtitle stream.
			The only subtitle encoder we have at this time is dvbsub.
		#tag EndNote
		SubtitleEncoder As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			--sout-transcode-soverlay, --no-sout-transcode-soverlay
			(default disabled)
			
			This option allows rendering subtitles directly on the video, while transcoding it.
			
			Do not confuse this option with senc/scodec that transcode the subtitles and stream them.
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
			This option allows to crop the lower part of the source video. The argument is the Y coordinate of the first line to be cropped.
		#tag EndNote
		VideoCropBottom As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This option allows to crop the left part of the source video while transcoding. The argument is the number
			of columns that should be cropped.
		#tag EndNote
		VideoCropLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This option allows to crop the right part of the source video. The argument is the X coordinate of the first column to be cropped.
		#tag EndNote
		VideoCropRight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This option allows to crop the upper part of the source video while transcoding. The value is the
			number of lines the video should be cropped.
		#tag EndNote
		VideoCropTop As Integer
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

	#tag Constant, Name = VIDEO_BITRATE_HIGH, Type = Double, Dynamic = False, Default = \"4500", Scope = Public
	#tag EndConstant

	#tag Constant, Name = VIDEO_BITRATE_HIGHEST, Type = Double, Dynamic = False, Default = \"15000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = VIDEO_BITRATE_MEDIUM, Type = Double, Dynamic = False, Default = \"2500", Scope = Public
	#tag EndConstant

	#tag Constant, Name = VIDEO_BITRATE_STANDARD, Type = Double, Dynamic = False, Default = \"1000", Scope = Public
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
			InitialValue="-1"
			Type="Integer"
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
			Name="DuplicateDestination"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DuplicateSelect"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElementaryStreamAccess"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElementaryStreamAccessAudio"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElementaryStreamAccessVideo"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElementaryStreamAudioDestination"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElementaryStreamAudioMuxer"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElementaryStreamDestination"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElementaryStreamMuxer"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElementaryStreamVideoDestination"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ElementaryStreamVideoMuxer"
			Group="Behavior"
			Type="String"
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
			Name="OutputAccess"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputDelay"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputDestination"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputMuxer"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputNoAudio"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputNoVideo"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputSAP"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputSAPGroup"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputSAPIPv6"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputSAPName"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OutputSLP"
			Group="Behavior"
			Type="Boolean"
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
			Name="VideoCropBottom"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoCropLeft"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoCropRight"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VideoCropTop"
			Group="Behavior"
			Type="Integer"
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
