@echo off
REM CDs to the current directory when cygwin is launched

SET LASTDIR=%CD%

D:
chdir D:\tools\cygwin\bin

python cyghere.py %LASTDIR%

cd %LASTDIR%
