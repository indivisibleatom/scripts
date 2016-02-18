@echo off
@echo Environment setup
@echo Arguments - %1 - drive name

SET TOOLS=%1\tools
SET DEV=%1\development
SET DOWN=%1\downloads
SET USER=%userprofile%

REM PATH additions
SET PATH=%PATH%;%TOOLS%\bin;%TOOLS%\anaconda;%TOOLS%\cmake\bin
SET PATH=%PATH%;%TOOLS%\anaconda\Scripts;%TOOLS%\julia\bin
SET PATH=%PATH%;%TOOLS%\miktex\miktex\bin\x64;%TOOLS%\imagemagick
SET PATH=%PATH%;%TOOLS%\git\cmd

REM aliases
doskey ..=cd ..
doskey f=findstr /spinr $*
doskey cp=copy $*
doskey ls=dir $*
doskey p=popd
doskey rm=del $*
doskey mv=move $*
doskey home=pushd %userprofile% $*
doskey dev=pushd %DEV%
doskey desk=pushd "%USER%\Desktop"
doskey down=pushd %DOWN%
doskey clear=cls

REM ##Important tools##
doskey vim="%TOOLS%\Vim\vim74\vim" $*
doskey n2="%TOOLS%\Vim\vim74\vim" $*
doskey git="%TOOLS%\git\bin\git.exe" $*
doskey tex="%TOOLS%\texmaker\texmaker.exe" $*
doskey zip="%TOOLS%\7-Zip\7z.exe" $*
doskey cygwin="%TOOLS%\cygwin\Cygwin.bat"
doskey meld="%TOOLS%\meld\Meld.exe" $*
doskey ipy=jupyter notebook $*
doskey paint=mspaint $*
REM doskey eclipse="%TOOLS%\eclipse\eclipse.exe" $*
REM doskey scpc="%TOOLS\winscp\winscp.com"

REM ##Cloud drives##
REM doskey drive=pushd "%USER%\Google Drive"
REM doskey box = pushd "%USER%\Dropbox"

REM ##Play ze music##
doskey playu="%TOOLS%\vlc\vlc.exe" --vout none -vvv $*
doskey white="%TOOLS%\vlc\vlc.exe" --vout none -vvv "https://www.youtube.com/watch?v=wzjWIxXBs_s"
doskey bach="%TOOLS%\vlc\vlc.exe" --vout none -vvv "https://www.youtube.com/watch?v=6JQm5aSjX6g"
doskey hindi="%TOOLS%\vlc\vlc.exe" --vout none -vvv "https://www.youtube.com/watch?v=Md3sr5d5Ofk&list=PLfI1Xkk7LAC7Qvuhs_Du7Jswhbucm_49P"

REM ##Georgia Tech classes##
doskey classes=pushd "%DEV%\classes"
doskey pr=pushd "%DEV%\classes\patternRec"

REM tools specific settings
REM RenderMan
set RMANTREE=%TOOLS%\renderman\RendermanProServer-20.7
set RMSTREE=%TOOLS%\renderman\RenderManStudio-20.7-maya2016
SET PATH=%PATH%;"%RMANTREE%\bin"

