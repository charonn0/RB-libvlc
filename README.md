# RB-libvlc
[libvlc](https://www.videolan.org/vlc/libvlc.html) is the open-source multimedia library that powers VLC Media Player. **RB-libvlc** is libvlc [binding](http://en.wikipedia.org/wiki/Language_binding) for Realbasic and Xojo ("classic" framework) projects.

![RB-libvlc under Windows 10](https://i.imgur.com/KsgRxUY.png)

_This screen shot depicts the RB-libvlc demo running on Windows 10_

# Highlights
* Play any media type supported by VLC.
* [Transcode](https://github.com/charonn0/RB-libvlc/wiki/libvlc.Medium.AddOption#example) one media format to another.
* [Embed video output](https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.EmbedWithin) in any window, container, or control.
* Works in console applications (video output will display in a window).
* 64-bit ready.
* Read and write [media metadata](https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.MetaData) (IDv3 tags, etc.)
* Open, create, play, and save [playlists](https://github.com/charonn0/RB-libvlc/wiki/libvlc.Playlist).
* Sound [equalization controls](https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer).

## Become a sponsor
If you use this code in a commercial project, or just want to show your appreciation, please consider sponsoring me through GitHub. https://github.com/sponsors/charonn0

## Synopsis
There are two main modes of operation: using the [VLCPlayer](https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer) class to play media without a GUI and the [VLCMediaPlayer](https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCMediaPlayer) which provides a GUI. libvlc also supports playlists through a separate [PlayList](https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList) interface.

|Object Class|Comment|
|------------|-------|
|[`VLCPlayer`](https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer)|A media player session.| 
|[`VLCMediaPlayer`](https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCMediaPlayer)|A media player session [embedded](https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.EmbedWithin) in a `Canvas` control.| 
|[`Medium`](https://github.com/charonn0/RB-libvlc/wiki/libvlc.Medium)|A media resource such as a file or internet stream.|
|[`Equalizer`](https://github.com/charonn0/RB-libvlc/wiki/libvlc.Equalizer)|An audio equalizer.|
|[`PlayList`](https://github.com/charonn0/RB-libvlc/wiki/libvlc.PlayList)|A list of `Medium` objects.|
|[`ListPlayer`](https://github.com/charonn0/RB-libvlc/wiki/libvlc.ListPlayer)|A specialized player for playing `PlayLists`.|

To play a media file or stream, create an instance of the Medium class by converting from a URL(as string) or a FolderItem.

## Example
```realbasic
 Dim vlc As New VLCPlayer
 vlc.Media = GetFolderItem("C:\example\music.mp3")
 vlc.Play()
```
Playback occurs asynchronously on a separate preemptive thread. You can determine the player state by querying the [CurrentState](https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.CurrentState) property and/or by handling the [ChangedState](https://github.com/charonn0/RB-libvlc/wiki/libvlc.VLCPlayer.ChangedState) event.

## How to incorporate libvlc into your Realbasic/Xojo project
### Import the libvlc module
1. Download the RB-libvlc project either in [ZIP archive format](https://github.com/charonn0/RB-libvlc/archive/master.zip) or by cloning the repository with your Git client.
2. Open the RB-libvlc project in REALstudio or Xojo. Open your project in a separate window.
3. Copy the libvlc module into your project and save.

### Ensure the VLC shared libraries are installed
Most systems do not have VLC (or libvlc) installed by default. You will need to ship the all the necessary files with your application. On Windows, these are `libvlc.dll`, `libvlccore.dll`, and the desired plugins in the `plugins` directory. For macOS refer to [this forum thread](https://forum.xojo.com/t/libvlc-macos-64bit/58798/9) for how to properly bundle the dylibs with your app.

RB-libvlc will raise a PlatformNotSupportedException when used if all required DLLs/SOs/DyLibs are not available at runtime. 
