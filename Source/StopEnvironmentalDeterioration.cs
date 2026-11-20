using System;
using System.Reflection;
using HarmonyLib;
using Verse;

namespace Lilly.StopEnvironmentalDeterioration
{
    [StaticConstructorOnStartup]
    internal static class Startup
    {
        static Startup()
        {
            var harmony = new Harmony("Lilly.StopEnvironmentalDeterioration");
            var targetType = AccessTools.TypeByName("RimWorld.SteadyEnvironmentEffects")
                          ?? AccessTools.TypeByName("Verse.SteadyEnvironmentEffects");

            if (targetType == null)
            {
                Log.Error("[Stop Environmental Deterioration] Could not find SteadyEnvironmentEffects. The patch was not applied.");
                return;
            }

            var target = AccessTools.Method(targetType, "TryDoDeteriorate");
            if (target == null)
            {
                Log.Error("[Stop Environmental Deterioration] Could not find SteadyEnvironmentEffects.TryDoDeteriorate. The patch was not applied.");
                return;
            }

            harmony.Patch(target, prefix: new HarmonyMethod(typeof(StopEnvironmentalDeteriorationPatch), nameof(StopEnvironmentalDeteriorationPatch.Prefix)));
            Log.Message("[Stop Environmental Deterioration] Environment deterioration logic disabled.");
        }
    }

    /// <summary>
    /// RimWorld routes periodic environment-caused deterioration through
    /// SteadyEnvironmentEffects.TryDoDeteriorate. Skipping the complete method
    /// prevents that environmental deterioration pass from running at all.
    /// It does not intercept Thing.TakeDamage, damage workers, fire, explosions,
    /// weapon hits, or other direct damage systems.
    /// </summary>
    [Static]
    internal static class StopEnvironmentalDeteriorationPatch
    {
        public static bool Prefix()
        {
            return false;
        }
    }
}
