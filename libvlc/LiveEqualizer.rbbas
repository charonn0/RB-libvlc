#tag Class
Private Class LiveEqualizer
Inherits libvlc.Equalizer
	#tag Method, Flags = &h0
		Sub Constructor(TargetPlayer As libvlc.VLCPlayer)
		  // Calling the overridden superclass constructor.
		  Super.Constructor()
		  mPlayer = New WeakRef(TargetPlayer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(TargetPlayer As libvlc.VLCPlayer, Preset As libvlc.Equalizer)
		  Me.Constructor(TargetPlayer)
		  mUpdateLock = True
		  Try
		    mIndex = Preset.mIndex
		    Dim c As UInt32 = Me.GetBandCount
		    For i As Integer = 0 To c - 1
		      Me.Amplification(i) = Preset.Amplification(i)
		    Next
		    Me.PreAmplification = Preset.PreAmplification
		  Finally
		    mUpdateLock = False
		  End Try
		  UpdateValues()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateValues()
		  If Not mUpdateLock And mPlayer <> Nil And mPlayer.Value IsA VLCPlayer Then
		    Dim p As VLCPlayer = VLCPlayer(mPlayer.Value)
		    p.Equalizer = Me
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mPlayer As WeakRef
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreAmplification"
			Group="Behavior"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PresetIndex"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
