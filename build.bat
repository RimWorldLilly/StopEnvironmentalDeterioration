@echo off
setlocal
cd /d "%~dp0"

rem Match Lilly-Mod-Manager: GameRoot is the RimWorld installation directory.
if "%GAME_ROOT%"=="" (
    for %%I in ("%~dp0..\..") do set "GAME_ROOT=%%~fI"
)

set "ASSEMBLY_CSHARP=%GAME_ROOT%\Assembly-CSharp.dll"
set "HARMONY_DLL=%GAME_ROOT%\..\..\workshop\content\294100\2009463077\1.7\Assemblies\0Harmony.dll"

echo Game root:       "%GAME_ROOT%"
echo Assembly-CSharp: "%ASSEMBLY_CSHARP%"
echo Harmony DLL:     "%HARMONY_DLL%"
echo.

if not exist "%ASSEMBLY_CSHARP%" (
    echo [ERROR] Assembly-CSharp.dll not found.
    pause
    exit /b 1
)

if not exist "%HARMONY_DLL%" (
    echo [ERROR] Harmony 1.7 DLL not found.
    pause
    exit /b 1
)

dotnet build "%~dp0StopEnvironmentalDeterioration.csproj" --configuration Release --nologo -p:GameRoot="%GAME_ROOT%"
if errorlevel 1 (
    echo.
    echo [ERROR] Build failed.
    pause
    exit /b 1
)

echo.
echo [SUCCESS] Built: "%~dp01.7\Assemblies\StopEnvironmentalDeterioration.dll"
pause
