@echo off
set version=%1
set mappingdir=%2
set appid=%3
set appkey=%4
set bundleid=%5

set pwd=%~dp0

"%pwd%\jre\bin\java.exe" -jar "%pwd%\buglyqq-upload-symbol.jar" -appid %appid% -appkey %appkey% -version "%version%" -bundleid "%bundleid%" -platform Android -inputMapping "%mappingdir%"
