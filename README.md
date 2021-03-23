# ESurfingKeepAlive
 用于天翼校园宽带客户端自动重拨号的[AutoHotKey](https://github.com/Lexikos/AutoHotkey_L)脚本

众所周知，电信的校园宽带客户端做得跟shi一样，上线48小时后还会自动断开。这能忍？这不能忍，特别是对于我这种宿舍里一大堆嗷嗷待哺的IoT设备等着软路由WiFi提供网络的时候——全部设备失联，直接把我整没法直立行走了😅

这个运行于AutoHotKey v2环境的脚本可以每隔一段时间（目前是45秒...是不是太长了？）检查网络连通状况（通过MIUI的联网检查服务器）。如果检查失败，则Kill掉客户端重新拨号。

需要管理员权限运行。Windows Defender似乎会报毒，如果你不信任Releases中的程序（嗯？），可以下载源代码和AHK然后[自己编译](https://ahkcn.github.io/docs/Scripts.htm#ahk2exe)。
