#tag Class
Protected Class VLCPlayer
	#tag Method, Flags = &h0
		Sub Constructor(MediaFile As FolderItem)
		  Dim m As libvlc.VLCMedium
		  m = m.LoadURL(MediaFile.URLPath)
		  Me.Constructor(m)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(Medium As libvlc.VLCMedium)
		  mPlayer = libvlc_media_player_new_from_media(Medium.Handle)
		  If mPlayer = Nil Then Raise New libvlc.VLCException(libvlc.GetInstance)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(MediaURL As String)
		  Dim m As libvlc.VLCMedium
		  m = m.LoadURL(MediaURL)
		  Me.Constructor(m)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub EmbedWithin(Parent As Integer)
		  #If TargetWin32 Then
		    libvlc_media_player_set_hwnd(mPlayer, Parent)
		  #ElseIf TargetMacOS
		    libvlc_media_player_set_nsobject(mPlayer, Parent)
		  #Else
		    libvlc_media_player_set_xwindow(mPlayer, Parent)
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmbedWithin(Parent As RectControl)
		  Me.EmbedWithin(Parent.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmbedWithin(Parent As Window)
		  Me.EmbedWithin(Parent.Handle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPosition() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPlaying() As Boolean
		  Return libvlc_media_player_is_playing(mPlayer)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pause()
		  libvlc_media_player_set_pause(mPlayer, 1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Play() As Boolean
		  Return libvlc_media_player_play(mPlayer) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resume()
		  libvlc_media_player_set_pause(mPlayer, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPosition(Percent As Integer)
		  libvlc_media_player_set_position(mPlayer, Percent / 100)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  libvlc_media_player_stop(mPlayer)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mPlayer As Ptr
	#tag EndProperty


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
