# Stop Environmental Deterioration

RimWorld 1.7 / Harmony

## Behavior

This mod patches `SteadyEnvironmentEffects.TryDoDeteriorate` with a Harmony Prefix that returns `false`, skipping that environmental deterioration routine.

It is intended to stop periodic deterioration caused by the environment. It does not patch general damage APIs such as `Thing.TakeDamage`; combat and other direct damage systems are not intentionally disabled.

## Build

1. Install the .NET 10 SDK.
2. Keep the RimWorld installation and Steam Workshop folder in the standard Steam layout.
3. Run `build.bat` from this mod folder.

The project targets `net10.0` to match the RimWorld 1.7 Harmony assembly, which references `System.Runtime 10.0.0.0`. The DLL reference paths follow the layout used by [Lilly-Mod-Manager](https://github.com/lilly1987/Lilly-Mod-Manager):

- Game root: two directory levels above this mod folder.
- RimWorld assembly: `$(GameRoot)\Assembly-CSharp.dll`.
- Harmony 1.7 assembly: `$(GameRoot)\..\..\workshop\content\294100\2009463077\1.7\Assemblies\0Harmony.dll`.

Set the `GAME_ROOT` environment variable before running `build.bat` if the game is installed in a nonstandard location.

The compiled DLL is emitted to `1.7/Assemblies/`.

## Compatibility note

The target type and method are resolved at runtime. If RimWorld 1.7 changes the type or method name, the mod logs an error and does not apply the patch.
