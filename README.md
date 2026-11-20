# Stop Environmental Deterioration

RimWorld 1.7 / Harmony

## Behavior

This mod patches `SteadyEnvironmentEffects.TryDoDeteriorate` with a Harmony Prefix that returns `false`, skipping that environmental deterioration routine.

It is intended to stop periodic deterioration caused by the environment. It does not patch general damage APIs such as `Thing.TakeDamage`; combat and other direct damage systems are not intentionally disabled.

## Build

1. Install the .NET Framework 4.7.2 targeting pack and a .NET SDK.
2. Keep the Harmony mod installed at `Mods/Harmony` (the build script expects `Mods/Harmony/Current/Assemblies/0Harmony.dll`).
3. Run `build.bat` from this mod folder.

The project detects the game Managed directory relative to this mod folder. If your installation uses a different location, set `RIMWORLD_MANAGED` to the directory containing `Assembly-CSharp.dll`. If Harmony is stored elsewhere, set `HARMONY_DLL` to the full path of `0Harmony.dll`.

The compiled DLL is emitted to `1.7/Assemblies/`.

## Compatibility note

The target type and method are resolved at runtime. If RimWorld 1.7 changes the type or method name, the mod logs an error and does not apply the patch.
