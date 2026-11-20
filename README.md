# Stop Environmental Deterioration

RimWorld 1.7 / Harmony

## Behavior

This mod patches `SteadyEnvironmentEffects.TryDoDeteriorate` with a Harmony Prefix that returns `false`. That skips the environmental deterioration routine entirely, instead of merely changing the final deterioration rate to zero.

Expected to prevent environment-driven deterioration such as items deteriorating while outdoors/unroofed or exposed to weather.

It deliberately does **not** patch general damage APIs. Combat damage, weapon hits, fire, explosions, and other direct damage should continue to work normally.

## Build

1. Install the .NET Framework 4.7.2 targeting pack and a .NET SDK.
2. Set `RIMWORLD_MANAGED` to your RimWorld `RimWorldWin64_Data/Managed` directory if the default path in `build.bat` is not correct.
3. Run `build.bat`.

The compiled DLL is emitted to `1.7/Assemblies/`.

## Compatibility note

The target method name is resolved at runtime to avoid hard-coding the game type at compile time. If RimWorld 1.7 changes the type or method name, the mod logs a clear error and leaves the game running without applying the patch.
