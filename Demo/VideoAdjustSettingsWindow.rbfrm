#tag Window
Begin Window VideoAdjustSettingsWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   3
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   1.83e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "Video adjustment"
   Visible         =   True
   Width           =   5.07e+2
   Begin Slider ContrastSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   80
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   200
      Minimum         =   0
      PageStep        =   20
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   2
      Top             =   5
      Value           =   100
      Visible         =   True
      Width           =   364
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Contrast:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   5
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   68
   End
   Begin Label ContrastLbl
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   448
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   1.000
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   5
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   59
   End
   Begin Slider BrightnessSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   80
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   200
      Minimum         =   0
      PageStep        =   20
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   2
      Top             =   33
      Value           =   100
      Visible         =   True
      Width           =   364
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      Text            =   "Brightness:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   68
   End
   Begin Label BrightnessLbl
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   448
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      Text            =   1.000
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   59
   End
   Begin Slider HueSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   80
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   36000
      Minimum         =   0
      PageStep        =   20
      Scope           =   2
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   63
      Value           =   18000
      Visible         =   True
      Width           =   364
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "Hue:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   63
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   68
   End
   Begin Label HueLbl
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   448
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   0.000
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   63
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   59
   End
   Begin Slider SaturationSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   80
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   300
      Minimum         =   0
      PageStep        =   20
      Scope           =   2
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   92
      Value           =   150
      Visible         =   True
      Width           =   364
   End
   Begin Label Label4
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      Text            =   "Saturation:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   92
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   68
   End
   Begin Label SaturationLbl
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   448
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   1.500
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   92
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   59
   End
   Begin Slider GammaSlider
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   80
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   1000
      Minimum         =   1
      PageStep        =   20
      Scope           =   2
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   120
      Value           =   100
      Visible         =   True
      Width           =   364
   End
   Begin Label Label5
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      Text            =   "Gamma:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   121
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   68
   End
   Begin Label GammaLbl
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   448
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   2
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      Text            =   1.000
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   121
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   59
   End
   Begin PushButton ResetBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Reset"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   218
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   2
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   153
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub SetSliders()
		  If mLock Then Return
		  mLock = True
		  Try
		    BrightnessSlider.Value = mBrightness * 100
		    ContrastSlider.Value = mContrast * 100
		    GammaSlider.Value = mGamma * 100
		    HueSlider.Value = mHue * 100
		    SaturationSlider.Value = mSaturation * 100
		  Finally
		    mLock = False
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowVideoOptions(Player As libvlc.VLCPlayer)
		  Player.VideoAdjustment(libvlc.AdjustOption.Enable) = 1
		  mBrightness = Player.VideoAdjustment(libvlc.AdjustOption.Brightness)
		  mBrightnessOriginal = mBrightness
		  mContrast = Player.VideoAdjustment(libvlc.AdjustOption.Contrast)
		  mContrastOriginal = mContrast
		  mGamma = Player.VideoAdjustment(libvlc.AdjustOption.Gamma)
		  mGammaOriginal = mGamma
		  mHue = Player.VideoAdjustment(libvlc.AdjustOption.Hue)
		  mHueOriginal = mHue
		  mSaturation = Player.VideoAdjustment(libvlc.AdjustOption.Saturation)
		  mSaturationOriginal = mSaturation
		  mTargetPlayer = Player
		  SetSliders()
		  Me.Show()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBrightness As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBrightnessOriginal As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContrast As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContrastOriginal As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGamma As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGammaOriginal As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHue As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHueOriginal As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLock As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSaturation As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSaturationOriginal As Single
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTargetPlayer As libvlc.VLCPlayer
	#tag EndProperty


#tag EndWindowCode

#tag Events ContrastSlider
	#tag Event
		Sub ValueChanged()
		  ContrastLbl.Text = Str(Me.Value / 100, "##0.00")
		  If Not mLock Then
		    mTargetPlayer.VideoAdjustment(libvlc.AdjustOption.Contrast) = Me.Value / 100
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BrightnessSlider
	#tag Event
		Sub ValueChanged()
		  BrightnessLbl.Text = Str(Me.Value / 100, "##0.00")
		  If Not mLock Then
		    mTargetPlayer.VideoAdjustment(libvlc.AdjustOption.Brightness) = Me.Value / 100
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HueSlider
	#tag Event
		Sub ValueChanged()
		  HueLbl.Text = Str(Me.Value / 100, "##0.00")
		  If Not mLock Then
		    mTargetPlayer.VideoAdjustment(libvlc.AdjustOption.Hue) = Me.Value / 100
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaturationSlider
	#tag Event
		Sub ValueChanged()
		  SaturationLbl.Text = Str(Me.Value / 100, "##0.00")
		  If Not mLock Then
		    mTargetPlayer.VideoAdjustment(libvlc.AdjustOption.Saturation) = Me.Value / 100
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GammaSlider
	#tag Event
		Sub ValueChanged()
		  GammaLbl.Text = Str(Me.Value / 100, "##0.00")
		  If Not mLock Then
		    mTargetPlayer.VideoAdjustment(libvlc.AdjustOption.Gamma) = Me.Value / 100
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResetBtn
	#tag Event
		Sub Action()
		  BrightnessSlider.Value = mBrightnessOriginal * 100
		  ContrastSlider.Value = mContrastOriginal * 100
		  GammaSlider.Value = mGammaOriginal * 100
		  HueSlider.Value = mHueOriginal * 100
		  SaturationSlider.Value = mSaturationOriginal * 100
		End Sub
	#tag EndEvent
#tag EndEvents
