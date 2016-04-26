# RB-libvlc
This project wraps libvlc, the open-source multimedia library behind VLC Media Player. It is designed and tested on 
Windows 7 using REALstuio 2011R4.3. Other platforms supported by libvlc should work, but have not been tested.

##Synopsis
There are two main modes of operation: using the VLCPlayer class to play media without a GUI and the VLCMediaPlayer which provides
a GUI.

###VLCPlayer
This class represents an instance of a VLC media player object.

###VLCMediaPlayer
The VLCMediaPlayer class subclasses the Canvas class, meaning it can be used in the window editor like any other control. It
uses the VLCPlayer class to control the media.
