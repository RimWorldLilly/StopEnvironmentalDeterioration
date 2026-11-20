@echo off
setlocal

rem Resolve the game Managed folder relative to this mod folder by default.
if "%RIMWORLD_MANAGED%"=="" (
    for %%I in ("%~dp0..\..\RimWorldWin64_Data\Managed") do set "RIMWORLD_MANAGED=%%~fI"
)

rem Harmony is a separate mod, not a RimWorld Managed assembly.
if "%HARMONY_DLL%"=="" (
    for %%I in ("%~dp0..\Harmony\Current\Assemblies\0Harmony.dll") do set "HARMONY_DLL=%%~fI"
)

echo RimWorld Managed: "%RIMWORLD_MANAGED%"
echo Harmony DLL:     "%HARMONY_DLL%"
echo.

dotnet build "%~dp0StopEnvironmentalDeterioration.csproj" -c Release -p:RimWorldManagedDir="%RIMWORLD_MANAGED%" -p:HarmonyDllPath="%HARMONY_DLL%"
if errorlevel 1 (
    echo.
    echo Build failed. Check the two paths printed above.
    pause
    exit /b 1
)

echo.
echo Build completed. DLL: 1.7\Assemblies\StopEnvironmentalDeterioration.dll
pause
