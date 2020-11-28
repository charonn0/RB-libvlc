#tag Class
Protected Class AudioTrackList
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
			  If Not System.IsFunctionAvailable("libvlc_media_get_codec_description", VLCLib) Then Return ""
			  Dim index As Integer = Owner.Media.TrackList.IndexOf(CurrentTrackID)
			  If index > -1 Then
			    Dim mb As MemoryBlock = libvlc_media_get_codec_description(TrackType.Audio, Owner.Media.TrackList.Codec(index))
			    If mb <> Nil Then Return mb.CString(0)
			  End If
			End Get
		#tag EndGetter
		Codec As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the I_ID of the current track.
			  
			  Return libvlc_audio_get_track(Owner.Handle)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the audio track to the I_ID specified by value. Call AudioTrackID to get the I_ID.
			  
			  If libvlc_audio_set_track(Owner.Handle, value) <> 0 Then Raise New VLCException("Unable to set the audio track to that index.")
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
