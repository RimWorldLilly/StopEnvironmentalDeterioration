@echo off
setlocal
if "%RIMWORLD_MANAGED%"=="" set "RIMWORLD_MANAGED=Y:\SteamLibrary\steamapps\common\RimWorld\RimWorldWin64_Data\Managed"
dotnet build StopEnvironmentalDeterioration.csproj -c Release -p:RimWorldManagedDir="%RIMWORLD_MANAGED%"
if errorlevel 1 (
  echo.
  echo Build failed. Check the RimWorld Managed directory and .NET Framework 4.7.2 targeting pack.
  pause
  exit /b 1
)
echo.
echo Build completed. Copy this mod folder into RimWorld\Mods if it is not already there.
pause
