--[[
    ================================================================
    CONFIGURATION FILE
    ================================================================

    This is a Lua file (.lua). Lua is a lightweight scripting
    language used to configure this mod's settings.

    HOW TO EDIT THIS FILE:
    1. Only change the values AFTER the equals sign (=).
    2. Numbers (like 1.0 or 2375) can be changed to your liking.
    3. Booleans (true or false) must stay lowercase.

    ABOUT COMMENTS:
    - Text starting with "--" is a single-line comment.
    - Text between "--[ [" and "] ]" is a multi-line comment.
    (Note: Spaces were added above to prevent syntax errors,
    in reality there are no spaces between the brackets).

    - Comments are IGNORED by the game. They are only here to
      provide instructions or remind you of the "Game defaults."
    - You can use comments to take notes for yourself!

    TIPS:
    - You can "comment out" specific lines to make the mod ignore
      them. If a line is commented out, the mod will use the
      game's original value instead.

      Example:
      LimitedMovementEncumbrance = {
        -- MaxSpeedMultiplier = 1.0,  <-- This line will be ignored
        bSprintingSuppressed = false, <-- This line will be applied
      }
    ================================================================
]]

SprintMultiplier = 1 / 1.6 -- game default: 1.6

-- 1900 = equivalent to hoverboard speed
-- 1900 * 1.25 = 2375 = equivalent to hoverboard max speed
MaxSpeed = 2375                   -- game default: 850.0

BrakingDecelerationWalking = 2000 -- game default: 200.0

--[[
    Accepted values

    MaxSpeedMultiplier: 0 to 1 or 0.0 to 1.0
    AirControlMultiplier: 0 to 1 or 0.0 to 1.0
    bSprintingSuppressed: true or false
    bJumpingSuppressed: true or false
]]

--[[
    Game defaults for LimitedMovementEncumbrance:

    MaxSpeedMultiplier = 0.33
    AirControlMultiplier = 0.33
    bSprintingSuppressed = true
    bJumpingSuppressed = true
]]
LimitedMovementEncumbrance = {
    MaxSpeedMultiplier = 1.0,
    AirControlMultiplier = 1.0,
    bSprintingSuppressed = false,
    bJumpingSuppressed = false
}

--[[
    Game defaults for HeavyCarryEncumbrance:

    MaxSpeedMultiplier = 0.8
    AirControlMultiplier = 0.5
    bSprintingSuppressed = false
    bJumpingSuppressed = false
]]
HeavyCarryEncumbrance = {
    MaxSpeedMultiplier = 1.0,
    AirControlMultiplier = 1.0,
    bSprintingSuppressed = false,
    bJumpingSuppressed = false
}

--[[
    Game defaults for the option HeldItemEncumbranceByTier:

    Tier 1:
    MaxSpeedMultiplier = 1.0
    AirControlMultiplier = 1.0
    bSprintingSuppressed = false
    bJumpingSuppressed = false

    Tier 2:
    MaxSpeedMultiplier = 1.0
    AirControlMultiplier = 0.9
    bSprintingSuppressed = false
    bJumpingSuppressed = false

    Tier 3:
    MaxSpeedMultiplier = 0.7
    AirControlMultiplier = 0.65
    bSprintingSuppressed = true
    bJumpingSuppressed = true

    Tier 4:
    MaxSpeedMultiplier = 0.6
    AirControlMultiplier = 0.5
    bSprintingSuppressed = true
    bJumpingSuppressed = true

    Tier 5:
    MaxSpeedMultiplier = 0.0
    AirControlMultiplier = 0.0
    bSprintingSuppressed = true
    bJumpingSuppressed = true
]]

--[[
    Understanding the Tiers
    -----------------------

    Tier 1 = very small (some debris)
    Tier 2 = small
    Tier 3 = medium
    Tier 4 = large
    Tier 5 = extra large
]]
HeldItemEncumbranceByTier = {
    Tier_1 = {
        MaxSpeedMultiplier = 1.0,
        AirControlMultiplier = 1.0,
        bSprintingSuppressed = false,
        bJumpingSuppressed = false
    },
    Tier_2 = {
        MaxSpeedMultiplier = 1.0,
        AirControlMultiplier = 1.0,
        bSprintingSuppressed = false,
        bJumpingSuppressed = false
    },
    Tier_3 = {
        MaxSpeedMultiplier = 1.0,
        AirControlMultiplier = 1.0,
        bSprintingSuppressed = false,
        bJumpingSuppressed = false
    },
    Tier_4 = {
        MaxSpeedMultiplier = 1.0,
        AirControlMultiplier = 1.0,
        bSprintingSuppressed = false,
        bJumpingSuppressed = false
    },
    Tier_5 = {
        MaxSpeedMultiplier = 1.0,
        AirControlMultiplier = 1.0,
        bSprintingSuppressed = false,
        bJumpingSuppressed = false
    }
}
