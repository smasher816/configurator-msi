@echo off
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT

:32BIT
echo 32-bit OS
dpscat32.exe
dpinst32.exe /f /se
goto END

:64BIT
echo 64-bit OS
dpscat64.exe
dpinst64.exe /f /se
:END