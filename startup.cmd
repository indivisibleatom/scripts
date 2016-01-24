@echo off
@echo Environment setup
@echo Arguments - %1 - drive name

SET TOOLS=%1"\tools"
SET DEV=%1"\development"
SET DOWN=%1"\downloads"
SET USER=%userprofile%

doskey ..=cd ..
doskey f=findstr /spinr $*
doskey cp=copy $*
doskey ls=dir
doskey p=popd
doskey rm=del $*
doskey mv=move $*

doskey home=pushd %userprofile% $*
doskey dev=pushd %DEV%
doskey desk=pushd %USER%"\Desktop"
doskey down=pushd %DOWN%

set backupdir=.\.backup,.,%TEMP%
set directory=.,.\.backup,%TEMP%

REM ##Important tools##
doskey vim=%TOOLS%"\Vim\vim74\vim" $*
doskey n2=%TOOLS%"\Vim\vim74\vim" $*
doskey git=%TOOLS%"\git\bin\git.exe" $*
doskey tex=%TOOLS%"\texmaker\texmaker.exe" $*
doskey zip=%TOOLS%"\tools\7-Zip\7z.exe" $*
doskey cygwin=%TOOLS%"\tools\cygwin\Cygwin.bat"
doskey ipy=jupyter notebook
REM doskey eclipse=%TOOLS%"\eclipse\eclipse.exe" $*
REM doskey scpc="c:\Development\tools\winscp\winscp.com"

REM ##Cloud drives##
REM doskey drive=pushd "C:\users\Mukul\Google Drive"
REM doskey box = pushd "C:\users\Mukul\Dropbox"

REM ##Play ze music##
doskey playu=%TOOLS%"\vlc\vlc.exe" --vout none -vvv $*
doskey white=%TOOLS%"\vlc\vlc.exe" --vout none -vvv "https://www.youtube.com/watch?v=vcJ-o_fh1B4"
doskey bach=%TOOLS%"\vlc\vlc.exe" --vout none -vvv "https://www.youtube.com/watch?v=6JQm5aSjX6g"
doskey hindi=%TOOLS%"\vlc\vlc.exe" --vout none -vvv "https://www.youtube.com/watch?v=Md3sr5d5Ofk&list=PLfI1Xkk7LAC7Qvuhs_Du7Jswhbucm_49P"

REM ##Georgia Tech classes##
doskey classes=pushd %DEV%"\classes"
doskey pr=pushd %DEV%"\classes\patternRec"

REM $$PATH additions##
@echo off
REM set PATH=%PATH%;c:\Development\tools\nodejs
REM set PATH=%PATH%;c:\Installed\MySQL\MySQL Server 5.6\bin
REM set PATH=%PATH%;c:\Development\tools\maven\bin
REM set PATH=%PATH%;C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\amd64
REM set PATH=%PATH%;C:\Program Files (x86)\CMake 2.8\bin
REM set PATH=%PATH%;C:\Windows\Microsoft.NET\Framework64\v4.0.30319
REM set JAVA_HOME=c:\Development\tools\jdk
REM set PATH=%PATH%;C:\Development\tools\cmdUtils
REM set PATH=%PATH%;C:\Installed\cmdUtils
REM set PATH=%PATH%;C:\Development\tools\cuda\toolkit\bin
@echo on
