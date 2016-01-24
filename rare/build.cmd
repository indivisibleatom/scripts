@REM Generic build batch script that farms out the work to msbuild, and executes the resulting binary
@REM usage - build <path to galileo.sln> <location of build log> <location of binary to execute>
@pushd %1
@msbuild Galileo.sln > %2
@if %ERRORLEVEL%==1 goto :onError
@%3
@if %ERRORLEVEL%==1 goto :onError
@popd

@goto :EOF

:onError
@popd
@exit /B 1
