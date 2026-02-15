--[[
    IMPORTANT: This options example file modifies only the character's movement speed.

    With these settings, the mod changes how movement works:

    1. DEFAULT WALK: Your normal walking speed is now equal to the
       original game's "Sprint" speed (MaxSpeed is boosted).

    2. TO WALK SLOWLY: Press and hold the "Sprint" key. Because the
       SprintMultiplier is set to a fraction (1 / 1.6), it actually
       reduces your speed instead of increasing it.

    In short: "Sprinting" now acts as your "Walk/Slow" button.

    TIP: You can also change the "sprint" behaviour in the game menu -> KEYBOARD/MOUSE SETTINGS -> HOLD TO SPRINT.
]]

SprintMultiplier = 1 / 1.6 -- game default: 1.6

MaxSpeed = 850 * 1.6       -- game default: 850.0
