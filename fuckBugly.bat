@echo off
set arg1=%1
set arg2=%2
set pwd=%~dp0
set appid=你的appId
set appkey=你的appkey
"%pwd%\jre\bin\java.exe" -jar "%pwd%\buglyqq-upload-symbol.jar" -appid %appid% -appkey %appkey% -version "%arg1%" -bundleid com.gsd.yd.xxkm -platform Android -inputMapping "%arg2%"