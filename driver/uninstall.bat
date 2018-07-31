@echo off

if "%PROCESSOR_ARCHITECTURE%"=="AMD64" goto 64BIT

:32BIT
echo 32-bit OS
dpinst32.exe /u kiibohd.inf /d /se
goto END

:64BIT
echo 64-bit OS
dpinst64.exe /u kiibohd.inf /d /se
:END