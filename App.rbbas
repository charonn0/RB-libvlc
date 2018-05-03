#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim bs As BinaryStream = BinaryStream.Open(GetFolderItem("D:\Music\Soundtracks\Elder Scrolls\Skyrim\Disk 1\The Elder Scrolls V- Skyrim - Night without Stars.flac"))
		  Dim m As New libvlc.Medium(bs)
		  Dim p As New VLCPlayer(m)
		  If Not p.Play() Then Break
		  Do Until Not p.IsPlaying
		    DoEvents
		  Loop
		  Quit
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
