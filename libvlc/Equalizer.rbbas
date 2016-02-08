#tag Class
Protected Class Equalizer
	#tag Method, Flags = &h0
		Function Amplification(Frequency As UInt32) As Single
		  Return libvlc_audio_equalizer_get_amp_at_index(mEqualizer, Frequency)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Amplification(Frequency As UInt32, NewAmplification As Single)
		  If libvlc_audio_equalizer_set_amp_at_index(mEqualizer, NewAmplification, Frequency) <> 0 Then
		    Raise New VLCException("Unable to set the amplification value for the specified frequency band.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mEqualizer = libvlc_audio_equalizer_new()
		  If mEqualizer = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC equalizer.")
		  mIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(Preset As UInt32)
		  mEqualizer = libvlc_audio_equalizer_new_from_preset(Preset)
		  If mEqualizer = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC equalizer from the preset.")
		  mIndex = Preset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mEqualizer <> Nil Then libvlc_audio_equalizer_release(mEqualizer)
		  mEqualizer = Nil
		  mIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetBandCount() As UInt32
		  Return libvlc_audio_equalizer_get_band_count()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetBandFrequency(BandNumber As UInt32) As Single
		  Return libvlc_audio_equalizer_get_band_frequency(BandNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetPreset(Index As UInt32) As libvlc.Equalizer
		  If Index > -1 And Index <= GetPresetCount() - 1 Then Return New Equalizer(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetPresetCount() As UInt32
		  Return libvlc_audio_equalizer_get_preset_count()
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return mEqualizer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PresetIndex() As Integer
		  Return mIndex
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mEqualizer As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndex As Integer = -1
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mIndex > -1 Then
			    Dim mb As MemoryBlock = libvlc_audio_equalizer_get_preset_name(mIndex)
			    If mb <> Nil Then Return mb.CString(0)
			  End If
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return libvlc_audio_equalizer_get_preamp(mEqualizer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If libvlc_audio_equalizer_set_preamp(mEqualizer, value) <> 0 Then Raise New VLCException("Unable to set the pre-amplification value for the equalizer.")
			End Set
		#tag EndSetter
		PreAmplification As Single
	#tag EndComputedProperty


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
			Name="PreAmplification"
			Group="Behavior"
			Type="Single"
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
