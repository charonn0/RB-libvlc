#tag Window
Begin Window EqualizerWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.61e+2
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
   Placement       =   0
   Resizeable      =   False
   Title           =   "Graphical Equalizer - VLC"
   Visible         =   True
   Width           =   6.26e+2
   Begin ComboBox Presets
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   ""
      Left            =   353
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   237
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   273
   End
   Begin CheckBox EnableEqualizerChkBx
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Equalizer enabled"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   6
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   238
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   162
   End
   Begin Slider PreAmp
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   16
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Left            =   70
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Left            =   122
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Left            =   278
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Left            =   330
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Left            =   382
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   7
      InitialParent   =   ""
      Left            =   434
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   8
      InitialParent   =   ""
      Left            =   486
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   9
      InitialParent   =   ""
      Left            =   538
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   10
      InitialParent   =   ""
      Left            =   590
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
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
      Left            =   6
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   37
      TabPanelIndex   =   0
      Text            =   "Preamp"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   ""
      Left            =   59
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   38
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   ""
      Left            =   111
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   39
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   ""
      Left            =   163
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   40
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   ""
      Left            =   215
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   41
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   ""
      Left            =   267
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   42
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   5
      InitialParent   =   ""
      Italic          =   ""
      Left            =   319
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   43
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   6
      InitialParent   =   ""
      Italic          =   ""
      Left            =   371
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   44
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   7
      InitialParent   =   ""
      Italic          =   ""
      Left            =   423
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   45
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   8
      InitialParent   =   ""
      Italic          =   ""
      Left            =   475
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   46
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   9
      InitialParent   =   ""
      Italic          =   ""
      Left            =   527
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   47
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   47
   End
   Begin Label BandName
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   10
      InitialParent   =   ""
      Italic          =   ""
      Left            =   579
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   48
      TabPanelIndex   =   0
      Text            =   "0000Hz"
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   10
      TextUnit        =   0
      Top             =   215
      Transparent     =   True
      Underline       =   ""
      Visible         =   False
      Width           =   47
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Left            =   226
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   49
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Slider BandFreq
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   217
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Left            =   174
      LineStep        =   1
      LiveScroll      =   ""
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   20
      Minimum         =   -20
      PageStep        =   20
      Scope           =   0
      TabIndex        =   50
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   0
      Top             =   0
      Value           =   0
      Visible         =   False
      Width           =   24
   End
   Begin Label PresetLbl
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
      Left            =   252
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   51
      TabPanelIndex   =   0
      Text            =   "Presets:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   238
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function FormatHertz(hertz As UInt64, precision As Integer = 2) As String
		  //Converts raw Hertz into SI formatted strings. 1KHz = 1000 Hertz.
		  //Optionally pass an integer representing the number of decimal places to return. The default is two decimal places. You may specify
		  //between 0 and 16 decimal places. Specifying more than 16 will append extra zeros to make up the length. Passing 0
		  //shows no decimal places and no decimal point.
		  
		  Const kilo = 1000
		  Dim mega As UInt64 = 1000 * kilo
		  Dim giga As UInt64 = 1000 * mega
		  Dim tera As UInt64 = 1000 * giga
		  
		  Dim suffix, precisionZeros As String
		  Dim strHertz As Double
		  
		  If hertz < kilo Then
		    strHertz = hertz
		    suffix = "Hz"
		  ElseIf hertz >= kilo And hertz < mega Then
		    strHertz = hertz / kilo
		    suffix = "KHz"
		  ElseIf hertz >= mega And hertz < giga Then
		    strHertz = hertz / mega
		    suffix = "MHz"
		  ElseIf hertz >= giga And hertz < tera Then
		    strHertz = hertz / giga
		    suffix = "GHz"
		  ElseIf hertz > tera Then
		    strHertz = hertz / tera
		    suffix = "THz"
		  End If
		  
		  While precisionZeros.Len < precision
		    precisionZeros = precisionZeros + "0"
		  Wend
		  If precisionZeros.Trim <> "" Then precisionZeros = "." + precisionZeros
		  Return Format(strHertz, "###0" + precisionZeros) + " " + suffix
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetSliders()
		  mLock = True
		  Try
		    Dim c As UInt32 = mPlayer.Equalizer.GetBandCount
		    For i As Integer = 0 To c - 1
		      BandFreq(i).Visible = True
		      BandFreq(i).Value = mPlayer.Equalizer.Amplification(i) * -1
		      BandName(i).Visible = True
		      BandName(i).Text = FormatHertz(mPlayer.Equalizer.GetBandFrequency(i))
		    Next
		    PreAmp.Value = mPlayer.Equalizer.PreAmplification * -1
		    Self.Width = BandName(c - 1).Left + BandName(c - 1).Width + 10
		    
		    Dim nm As String = mPlayer.Equalizer.Name
		    If nm <> "" Then
		      For i As Integer = 0 To Presets.ListCount - 1
		        If Presets.List(i) = nm Then
		          Presets.ListIndex = i
		          Exit For
		        End If
		      Next
		    Else
		      Presets.ListIndex = -1
		    End If
		    
		  Finally
		    mLock = False
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowEqualizer(Player As libvlc.VLCPlayer)
		  mPlayer = Player
		  If mPlayer.Media <> Nil Then Self.Title = "Graphical Equalizer - '" + mPlayer.Media.Title + "' - VLC"
		  SetSliders()
		  Me.ShowModal()
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mLastEqualizer As libvlc.Equalizer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLock As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPlayer As VLCPlayer
	#tag EndProperty


#tag EndWindowCode

#tag Events Presets
	#tag Event
		Sub Open()
		  Dim c As UInt32 = mPlayer.Equalizer.GetPresetCount
		  For i As Integer = 0 To c - 1
		    Dim e As libvlc.Equalizer = mPlayer.Equalizer.GetPreset(i)
		    Me.AddRow(e.Name)
		    Me.RowTag(i) = e
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex > -1 And Not mLock Then
		    mPlayer.Equalizer = Me.RowTag(Me.ListIndex)
		    SetSliders()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EnableEqualizerChkBx
	#tag Event
		Sub Action()
		  If Me.Value Then
		    mPlayer.Equalizer = mLastEqualizer
		    mLastEqualizer = Nil
		    Presets.Enabled = True
		    Dim c As UInt32 = mPlayer.Equalizer.GetBandCount
		    For i As Integer = 0 To c - 1
		      BandFreq(i).Enabled = True
		    Next
		    PreAmp.Enabled = True
		  Else
		    mLastEqualizer = mPlayer.Equalizer
		    mPlayer.Equalizer = Nil
		    Presets.Enabled = False
		    Dim c As UInt32 = mPlayer.Equalizer.GetBandCount
		    For i As Integer = 0 To c - 1
		      BandFreq(i).Enabled = False
		    Next
		    PreAmp.Enabled = False
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PreAmp
	#tag Event
		Sub ValueChanged()
		  If Not mLock Then mPlayer.Equalizer.PreAmplification = Me.Value * -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BandFreq
	#tag Event
		Sub ValueChanged(index as Integer)
		  If Not mLock Then mPlayer.Equalizer.Amplification(index) = Me.Value * -1
		End Sub
	#tag EndEvent
#tag EndEvents
