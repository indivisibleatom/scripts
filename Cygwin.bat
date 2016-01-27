@echo off

SET LASTDIR=%CD%

D:
chdir D:\tools\cygwin\bin

python cyghere.py %LASTDIR%

cd %LASTDIR%
