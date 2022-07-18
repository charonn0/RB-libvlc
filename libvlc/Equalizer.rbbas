#tag Class
Protected Class Equalizer
	#tag Method, Flags = &h0
		Function Amplification(Band As UInt32) As Single
		  ' Gets the amplification for the specified band. The Band parameter is the index of the band.
		  ' Amplification values are in the range of -20.0 to +20.0 inclusive. Returns NaN if the band
		  ' index is invalid.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.Amplification
		  
		  If mEqualizer <> Nil Then Return libvlc_audio_equalizer_get_amp_at_index(mEqualizer, Band)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Amplification(Band As UInt32, Assigns NewAmplification As Single)
		  ' Sets the amplification for the specified band. The Band parameter is the index of the band.
		  ' Amplification values are in the range of -20.0 to +20.0 inclusive.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.Amplification
		  
		  If mEqualizer <> Nil Then
		    If libvlc_audio_equalizer_set_amp_at_index(mEqualizer, NewAmplification, Band) <> 0 Then
		      Raise New VLCException("Unable to set the amplification value for the specified frequency band.")
		    End If
		  End If
		  UpdateValues()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' Construct a new instance of Equalizer.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.Constructor
		  
		  If Not libvlc.IsAvailable Then Raise New PlatformNotSupportedException
		  mEqualizer = libvlc_audio_equalizer_new()
		  If mEqualizer = Nil Then Raise New libvlc.VLCException("Unable to construct a VLC equalizer.")
		  mIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(CopyFrequencies As libvlc.Equalizer)
		  ' Construct a new instance of Equalizer and copy the frequencies of the CopyFrequencies instance.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.Constructor
		  
		  Me.Constructor()
		  mIndex = CopyFrequencies.mIndex
		  Dim c As UInt32 = Me.GetBandCount
		  For i As Integer = 0 To c - 1
		    Me.Amplification(i) = CopyFrequencies.Amplification(i)
		  Next
		  Me.PreAmplification = CopyFrequencies.PreAmplification
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(Preset As UInt32)
		  ' Construct a new instance of Equalizer from the index of a preset.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.Constructor
		  
		  If Not libvlc.IsAvailable Then Raise New PlatformNotSupportedException
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
		  ' Gets the number of frequency bands.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.GetBandCount
		  
		  If libvlc.IsAvailable Then Return libvlc_audio_equalizer_get_band_count() Else Raise New PlatformNotSupportedException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetBandFrequency(BandNumber As UInt32) As Single
		  ' Gets the frequency of the band at BandNumber, in Hertz. The first index is zero; the last
		  ' index is at Equalizer.GetBandCount- 1
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.GetBandFrequency
		  
		  If libvlc.IsAvailable Then Return libvlc_audio_equalizer_get_band_frequency(BandNumber) Else Raise New PlatformNotSupportedException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetPreset(Index As UInt32) As libvlc.Equalizer
		  ' Gets the Equalizer preset at Index. The last Index is at GetPresetCount - 1.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.GetPreset
		  
		  If Index < 0 Or Index > GetPresetCount() - 1 Then Raise New OutOfBoundsException
		  Return New Equalizer(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function GetPresetCount() As UInt32
		  ' Gets the number of equalizer presets.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.GetPresetCount
		  
		  If libvlc.IsAvailable Then Return libvlc_audio_equalizer_get_preset_count() Else Raise New PlatformNotSupportedException
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateValues()
		  // meh. Only interesting to LiveEqualizer
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the equalizer's VLC handle.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.Handle
			  
			  Return mEqualizer
			End Get
		#tag EndGetter
		Handle As Ptr
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mEqualizer As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mIndex As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mUpdateLock As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' If the Equalizer represents a named preset then this property contains the name.
			  ' e.g. "Full bass", "Soft", "Techno".
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.Name
			  
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
			  ' Gets the pre-amplification value for the Equalizer, in Hertz. Valid values are between -20.0 and +20.0.
			  '
			  ' See:
			  'https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.PreAmplification
			  
			  If mEqualizer <> Nil Then Return libvlc_audio_equalizer_get_preamp(mEqualizer)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the pre-amplification value for the Equalizer, in Hertz. Valid values are between -20.0 and +20.0.
			  '
			  ' See:
			  'https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.PreAmplification
			  
			  If mEqualizer <> Nil Then
			    If libvlc_audio_equalizer_set_preamp(mEqualizer, value) <> 0 Then Raise New VLCException("Unable to set the pre-amplification value for the equalizer.")
			  End If
			  UpdateValues()
			End Set
		#tag EndSetter
		PreAmplification As Single
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' If the Equalizer instance represents a named preset then this property contains the
			  ' index of that preset. Otherwise it contains -1.
			  '
			  ' See:
			  ' https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer.PresetIndex
			  
			  Return mIndex
			End Get
		#tag EndGetter
		PresetIndex As Integer
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
