#tag Class
Protected Class SubtitlesTrackList
Inherits libvlc.Meta.TrackList
	#tag Method, Flags = &h1000
		Sub Constructor(ListPtr As Ptr, Player As libvlc.VLCPlayer)
		  // Calling the overridden superclass constructor.
		  // Constructor(ListPtr As Ptr) -- From TrackList
		  Super.Constructor(ListPtr)
		  mOwner = New WeakRef(Player)
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the I_ID of the current track.
			  
			  Return libvlc_video_get_spu(Owner.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the subtitles track to the I_ID specified by NewTrack. 
			  
			  If libvlc_video_set_spu(Owner.Handle, value) <> 0 Then Raise New VLCException("Unable to assign that subtitle index.")
			End Set
		#tag EndSetter
		CurrentTrackID As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mOwner <> Nil And mOwner.Value IsA libvlc.VLCPlayer Then Return libvlc.VLCPlayer(mOwner.Value)
			End Get
		#tag EndGetter
		Owner As libvlc.VLCPlayer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Count"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="libvlc.Meta.LinkedList"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentTrackID"
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
