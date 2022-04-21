@echo off
set arg1=%1
set arg2=%2
set pwd=%~dp0
"%pwd%\jre\bin\java.exe" -jar "%pwd%\buglyqq-upload-symbol.jar" -appid 0901e6ad80 -appkey d5a05e05-4f46-4c69-9d7d-ac5e8b7d9afe -version "%arg1%" -bundleid com.gsd.yd.xxkm -platform Android -inputMapping "%arg2%"