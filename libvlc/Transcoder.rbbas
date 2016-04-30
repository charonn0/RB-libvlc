#tag Class
Protected Class Transcoder
Inherits libvlc.VLCPlayer
	#tag Method, Flags = &h1000
		Sub Constructor(argc As Integer, argv As String)
		  // Calling the overridden superclass constructor.
		  // Constructor(argc As Integer = DEFAULT_ARGC, argv As String = DEFAULT_ARGV) -- From VLCInstance
		  Super.Constructor(argc, argv)
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="AppName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AspectRatio"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanPause"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanPlay"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanSeek"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaptureKeyboard"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaptureMouse"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Fullscreen"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasAudio"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasSubtitles"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasVideo"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsPlaying"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Logging"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Muted"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Position"
			Group="Behavior"
			Type="Single"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Scale"
			Group="Behavior"
			Type="Single"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Speed"
			Group="Behavior"
			Type="Single"
			InheritedFrom="libvlc.VLCPlayer"
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
		#tag ViewProperty
			Name="UserAgent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Volume"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="libvlc.VLCPlayer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
