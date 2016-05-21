#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim opts As New libvlc.TranscodeOptions
		  'opts.AddOption("transcode", "acodec", "mp3")
		  'opts.AddOption("transcode", "ab", "128")
		  'opts.AddOption("transcode", "channels", "2")
		  'opts.AddOption("transcode", "samplerate", "44100")
		  'opts.AddOption("std", "access", "file")
		  'opts.AddOption("std", "mux", "raw")
		  'opts.AddOption("std", "dst", """" + GetSaveFolderItem(MediaFileTypes.AudioMp3, "music.mp3").AbsolutePath + """")
		  opts.AddOption("duplicate",
		  
		  Dim m As libvlc.Medium = GetOpenFolderItem(MediaFileTypes.MediaOgg)
		  Dim p As VLCPlayer = libvlc.CreateTranscoder(m, opts)
		  p.Play()
		  Do
		    DoEvents
		  Loop Until p.CurrentState = libvlc.PlayerState.STOPPING Or p.CurrentState = libvlc.PlayerState.ENDED Or p.CurrentState = libvlc.PlayerState.ERROR
		  Break
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
