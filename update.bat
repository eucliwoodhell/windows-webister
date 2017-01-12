@echo off
:start
setlocal
echo Updating System...
if not exist "C:\Temp" mkdir C:\Temp
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/alwaysontop617/webister/archive/master.zip', 'C:\Temp\master.zip')"
cd /d %~dp0
Call :UnZipFile "C:\Temp\" "C:\Temp\master.zip"
@RD /S /Q "%ProgramFiles(x86)%\Webister\webister-master\application\tmp\webister\interface"
echo d | xcopy "C:\Temp\webister-master\application\tmp\webister\interface" "%ProgramFiles(x86)%\Webister\webister-master\application\tmp\webister\interface" /s /e /h
if not exist "%ProgramFiles(x86)%\Webister\webister-master\application\tmp\webister\interface" goto start
@RD /S /Q "C:\Temp\"
exit /b
:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%