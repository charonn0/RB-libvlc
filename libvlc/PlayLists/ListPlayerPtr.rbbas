#tag Class
Private Class ListPlayerPtr
Inherits libvlc.PlayLists.ListPlayer
	#tag Method, Flags = &h1000
		Sub Constructor(FromPtr As Ptr, AddRef As Boolean)
		  // Calling the overridden superclass constructor.
		  // Constructor(FromPtr As Ptr, AddRef As Boolean) -- From ListPlayer
		  Super.Constructor(FromPtr, AddRef)
		  
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
			Name="CanMoveNext"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.PlayLists.ListPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanMovePrev"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.PlayLists.ListPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsPlaying"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.PlayLists.ListPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListCount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="libvlc.PlayLists.ListPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ListIndex"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="libvlc.PlayLists.ListPlayer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Logging"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libvlc.VLCInstance"
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
		#tag ViewProperty
			Name="UserAgent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libvlc.VLCInstance"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
