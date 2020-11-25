#tag Window
Begin ContainerControl AdvancedOptionsEditor
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   185
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   3.2e+1
   LockBottom      =   ""
   LockLeft        =   ""
   LockRight       =   ""
   LockTop         =   ""
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   3.2e+1
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   500
   Begin ComboBox StdAccessMnu
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "\r\nfile\r\nAppend\r\nudp\r\nhttp\r\nhttps\r\nmmsh\r\nshout"
      Italic          =   ""
      Left            =   105
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   2
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   103
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
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      Text            =   "Destintation:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   31
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   98
   End
   Begin TextField StdDstField
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   105
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   31
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   312
   End
   Begin PushButton StdSaveAsBtn
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Save as..."
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   420
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   31
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin ComboBox StdMuxMnu
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "\r\nts\r\nps\r\nmpeg1\r\nogg\r\nasf\r\nasfh\r\navi\r\nmpjpeg"
      Italic          =   ""
      Left            =   272
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   2
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   103
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
      Left            =   211
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "Muxer:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   2
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   58
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
      Left            =   15
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      Text            =   "Access:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   2
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   85
   End
   Begin Label ABitrateLbl
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
      Left            =   125
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      Text            =   "0000000 KHz"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   56
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   78
   End
   Begin UpDownArrows ABitrateArrows
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   107
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   56
      Visible         =   True
      Width           =   13
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
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      Text            =   "Audio bitrate:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   56
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label VBitrateLbl
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
      Left            =   125
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      Text            =   "0000000 KHz"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   81
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   78
   End
   Begin UpDownArrows VBitrateArrows
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   107
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   81
      Visible         =   True
      Width           =   13
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
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      Text            =   "Video bitrate:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   81
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label AChannels
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
      Left            =   342
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      Text            =   2
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   56
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   27
   End
   Begin UpDownArrows AChannelsArrows
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   324
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   56
      Visible         =   True
      Width           =   13
   End
   Begin Label Label6
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
      Left            =   219
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      Text            =   "Audio channels:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   56
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin ComboBox ASampleRateMnu
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "\r\n11250\r\n22500\r\n44100\r\n48000"
      Italic          =   ""
      Left            =   324
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   80
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   103
   End
   Begin Label Label7
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
      Left            =   211
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      Text            =   "Audio samplerate:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   80
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   108
   End
   Begin CheckBox VDeinterlaceChkBx
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Deinterlace"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   400
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   3
      Underline       =   ""
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label VFrameRateLbl
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
      Left            =   125
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   20
      TabPanelIndex   =   0
      Text            =   "0 fps"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   106
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   78
   End
   Begin UpDownArrows VFramerateArrows
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   107
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   106
      Visible         =   True
      Width           =   13
   End
   Begin Label Label8
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
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   22
      TabPanelIndex   =   0
      Text            =   "Video framerate:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   106
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label VScaleLbl
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
      Left            =   342
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      Text            =   "0 fps"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   106
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   78
   End
   Begin UpDownArrows VScaleArrows
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   324
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   106
      Visible         =   True
      Width           =   13
   End
   Begin Label Label9
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
      Left            =   219
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   25
      TabPanelIndex   =   0
      Text            =   "Video scale:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   106
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin Label StdThreadCountLbl
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
      Left            =   125
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   26
      TabPanelIndex   =   0
      Text            =   1
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   131
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   78
   End
   Begin UpDownArrows StdThreadCountArrows
      AcceptFocus     =   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   107
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   131
      Visible         =   True
      Width           =   13
   End
   Begin Label Label10
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
      Left            =   2
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   28
      TabPanelIndex   =   0
      Text            =   "Thread count:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   131
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   100
   End
   Begin ComboBox ACodecMnu
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "\r\nmpga\r\nmp3\r\nmp4a\r\na52\r\nvorb\r\nopus\r\nspx\r\nflac"
      Italic          =   ""
      Left            =   105
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   157
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   103
   End
   Begin Label Label11
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
      Left            =   15
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      Text            =   "Audio codec:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   157
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   87
   End
   Begin ComboBox VCodecMnu
      AutoComplete    =   False
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialValue    =   "\r\nmp1v\r\nmp2v\r\nmp4v\r\nSVQ1\r\nSVQ3\r\nDVDv\r\nWMV1\r\nWMV2\r\nWMV3\r\nDVSD\r\nMJPG\r\nH263\r\nh264\r\ntheo\r\nIV20\r\nIV40\r\nRV10\r\ncvid\r\nVP31\r\nFLV1\r\nCYUV\r\nHFYU\r\nMSVC\r\nMRLE\r\nAASC\r\nFLIC\r\nQPEG\r\nVP8"
      Italic          =   ""
      Left            =   322
      ListIndex       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   157
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   103
   End
   Begin Label Label12
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
      Left            =   232
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   32
      TabPanelIndex   =   0
      Text            =   "Video codec:"
      TextAlign       =   2
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   157
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   87
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  UpdateUI(False)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub UpdateUI(Changed As Boolean)
		  mLockUI = True
		  If mOptions = Nil Then mOptions = New libvlc.TranscodeOptions
		  If mOptions.AudioBitrate > 0 Then ABitrateLbl.Text = Format(mOptions.AudioBitrate, "#####0") + " kbit/s"
		  If mOptions.AudioChannels > 0 Then AChannels.Text = Format(mOptions.AudioChannels, "#####0")
		  Select Case mOptions.AudioCodec
		  Case "mpga"
		    ACodecMnu.ListIndex = 1
		  Case "mp3"
		    ACodecMnu.ListIndex = 2
		  Case "mp4a"
		    ACodecMnu.ListIndex = 3
		  Case "a52"
		    ACodecMnu.ListIndex = 4
		  Case "vorb"
		    ACodecMnu.ListIndex = 5
		  Case "opus"
		    ACodecMnu.ListIndex = 6
		  Case "spx"
		    ACodecMnu.ListIndex = 7
		  Case "flac"
		    ACodecMnu.ListIndex = 8
		  End Select
		  Select Case mOptions.AudioSampleRate
		  Case 11250
		    ASampleRateMnu.ListIndex = 1
		  Case 22500
		    ASampleRateMnu.ListIndex = 2
		  Case 44100
		    ASampleRateMnu.ListIndex = 3
		  Case 48000
		    ASampleRateMnu.ListIndex = 4
		  End Select
		  Select Case mOptions.OutputAccess
		  Case "file"
		    StdAccessMnu.ListIndex = 1
		  Case "append"
		    StdAccessMnu.ListIndex = 2
		  Case "udp"
		    StdAccessMnu.ListIndex = 3
		  Case "http"
		    StdAccessMnu.ListIndex = 4
		  Case "https"
		    StdAccessMnu.ListIndex = 5
		  Case "mmsh"
		    StdAccessMnu.ListIndex = 6
		  Case "shout"
		    StdAccessMnu.ListIndex = 7
		  End Select
		  Select Case mOptions.OutputMuxer
		  Case "ts"
		    StdMuxMnu.ListIndex = 1
		  Case "ps"
		    StdMuxMnu.ListIndex = 2
		  Case "mpeg1"
		    StdMuxMnu.ListIndex = 3
		  Case "ogg"
		    StdMuxMnu.ListIndex = 4
		  Case "asf"
		    StdMuxMnu.ListIndex = 5
		  Case "asfh"
		    StdMuxMnu.ListIndex = 6
		  Case "avi"
		    StdMuxMnu.ListIndex = 7
		  Case "mpjpeg"
		    StdMuxMnu.ListIndex = 8
		  End Select
		  If mOptions.VideoBitrate > 0 Then VBitrateLbl.Text = Format(mOptions.VideoBitrate, "#####0") + " kbit/s"
		  Select Case mOptions.VideoCodec
		  Case "mp1v"
		    VCodecMnu.ListIndex = 1
		  Case "mp2v"
		    VCodecMnu.ListIndex = 2
		  Case "mp4v"
		    VCodecMnu.ListIndex = 3
		  Case "SVQ1"
		    VCodecMnu.ListIndex = 4
		  Case "SVQ3"
		    VCodecMnu.ListIndex = 5
		  Case "DVDv"
		    VCodecMnu.ListIndex = 6
		  Case "WMV1"
		    VCodecMnu.ListIndex = 7
		  Case "WMV2"
		    VCodecMnu.ListIndex = 8
		  Case "WMV3"
		    VCodecMnu.ListIndex = 9
		  Case "DVSD"
		    VCodecMnu.ListIndex = 10
		  Case "MJPG"
		    VCodecMnu.ListIndex = 11
		  Case "H263"
		    VCodecMnu.ListIndex = 12
		  Case "h264"
		    VCodecMnu.ListIndex = 13
		  Case "theo"
		    VCodecMnu.ListIndex = 14
		  Case "IV20"
		    VCodecMnu.ListIndex = 15
		  Case "IV40"
		    VCodecMnu.ListIndex = 16
		  Case "RV10"
		    VCodecMnu.ListIndex = 17
		  Case "cvid"
		    VCodecMnu.ListIndex = 18
		  Case "VP31"
		    VCodecMnu.ListIndex = 19
		  Case "FLV1"
		    VCodecMnu.ListIndex = 20
		  Case "CYUV"
		    VCodecMnu.ListIndex = 21
		  Case "HFYU"
		    VCodecMnu.ListIndex = 22
		  Case "MSVC"
		    VCodecMnu.ListIndex = 23
		  Case "MRLE"
		    VCodecMnu.ListIndex = 24
		  Case "AASC"
		    VCodecMnu.ListIndex = 25
		  Case "FLIC"
		    VCodecMnu.ListIndex = 26
		  Case "QPEG"
		    VCodecMnu.ListIndex = 27
		  Case "VP8"
		    VCodecMnu.ListIndex = 28
		  End Select
		  VDeinterlaceChkBx.Value = mOptions.VideoDeinterlace
		  If mOptions.VideoFrameRate > 0 Then
		    VFramerateLbl.Text = Format(mOptions.VideoFrameRate, "#####0") + " FPS"
		  End If
		  If mOptions.VideoScale > 0.001 Then VScaleLbl.Text = Format(mOptions.VideoScale, "#####0.0###") + "x"
		  If mOptions.ThreadCount > 0 Then StdThreadCountLbl.Text = Format(mOptions.ThreadCount, "#####0")
		  If mOptions.OutputDestination <> StdDstField.Text Then StdDstField.Text = mOptions.OutputDestination
		  If Changed Then RaiseEvent OptionsChanged(mOptions)
		Finally
		  mLockUI = False
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event OptionsChanged(NewOptions As libvlc.TranscodeOptions)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mLockUI As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOptions As libvlc.TranscodeOptions
	#tag EndProperty


#tag EndWindowCode

#tag Events StdAccessMnu
	#tag Event
		Sub Change()
		  If mLockUI Then Return
		  mOptions.OutputAccess = Me.Text
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StdDstField
	#tag Event
		Sub TextChange()
		  If mLockUI Then Return
		  mOptions.OutputDestination = Me.Text
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StdSaveAsBtn
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetSaveFolderItem(MediaFileTypes.All, "")
		  If f = Nil Then Return
		  
		  #If RBVersion > 2019 Then
		    StdDstField.Text = f.NativePath
		  #Else
		    StdDstField.Text = f.AbsolutePath
		  #endif
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StdMuxMnu
	#tag Event
		Sub Change()
		  If mLockUI Then Return
		  mOptions.OutputMuxer = Me.Text
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ABitrateArrows
	#tag Event
		Sub Up()
		  If mLockUI Then Return
		  mOptions.AudioBitrate = mOptions.AudioBitrate + 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  If mLockUI Or mOptions.AudioBitrate = 0 Then Return
		  mOptions.AudioBitrate = mOptions.AudioBitrate - 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VBitrateArrows
	#tag Event
		Sub Up()
		  If mLockUI Then Return
		  mOptions.VideoBitrate = mOptions.VideoBitrate + 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  If mLockUI Or mOptions.VideoBitrate = 0 Then Return
		  mOptions.VideoBitrate = mOptions.VideoBitrate - 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AChannelsArrows
	#tag Event
		Sub Up()
		  If mLockUI Then Return
		  mOptions.AudioChannels = mOptions.AudioChannels + 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  If mLockUI Or mOptions.AudioChannels = 0 Then Return
		  mOptions.AudioChannels = mOptions.AudioChannels - 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ASampleRateMnu
	#tag Event
		Sub Change()
		  If mLockUI Then Return
		  mOptions.AudioSampleRate = Val(Me.Text)
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VDeinterlaceChkBx
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  mOptions.VideoDeinterlace = Me.Value
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VFramerateArrows
	#tag Event
		Sub Up()
		  If mLockUI Then Return
		  mOptions.VideoFrameRate = mOptions.VideoFrameRate + 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  If mLockUI Or mOptions.VideoFrameRate = 0 Then Return
		  mOptions.VideoFrameRate = mOptions.VideoFrameRate - 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VScaleArrows
	#tag Event
		Sub Up()
		  If mLockUI Then Return
		  mOptions.VideoScale = mOptions.VideoScale + 1.0
		  UpdateUI(True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  If mLockUI Or mOptions.VideoScale < 0.0001 Then Return
		  mOptions.VideoScale = mOptions.VideoScale - 1.0
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StdThreadCountArrows
	#tag Event
		Sub Up()
		  If mLockUI Then Return
		  mOptions.ThreadCount = mOptions.ThreadCount + 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Down()
		  If mLockUI Or mOptions.ThreadCount = 0 Then Return
		  mOptions.ThreadCount = mOptions.ThreadCount - 1
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ACodecMnu
	#tag Event
		Sub Change()
		  If mLockUI Then Return
		  mOptions.AudioCodec = Me.Text
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VCodecMnu
	#tag Event
		Sub Change()
		  If mLockUI Then Return
		  mOptions.VideoCodec = Me.Text
		  UpdateUI(True)
		End Sub
	#tag EndEvent
#tag EndEvents
