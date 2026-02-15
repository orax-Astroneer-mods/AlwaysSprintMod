local modInfo = (function()
    local info = debug.getinfo(2, "S")
    local source = info.source:gsub("\\", "/")
    return {
        name = source:match("@?.+/([^/]+)/[Ss]cripts/"),
        file = source:sub(2),
        currentDirectory = source:match("@?(.+)/"),
        currentModDirectory = source:match("@?(.+)/[Ss]cripts/"),
        modsDirectory = source:match("@?(.+)/[^/]+/[Ss]cripts/")
    }
end)()

---@param filename string
---@return boolean
local function isFileExists(filename)
    local file = io.open(filename, "r")
    if file ~= nil then
        io.close(file)
        return true
    else
        return false
    end
end

local function loadOptions()
    local file = string.format([[%s\options.lua]], modInfo.currentModDirectory)

    if not isFileExists(file) then
        local cmd = string.format([[copy "%s\options.example.lua" "%s\options.lua"]],
            modInfo.currentModDirectory,
            modInfo.currentModDirectory)

        print("Copy example options to options.lua. Execute command: " .. cmd .. "\n")

        os.execute(cmd)
    end

    dofile(file)
end

loadOptions()

---@param movementComponent UAstroCharacterMovementComponent
local function ApplyMovementSettings(movementComponent)
    if not movementComponent or not movementComponent:IsValid() or movementComponent:IsBeingDestroyed() then
        return
    end
    if SprintMultiplier ~= nil then
        movementComponent.SprintMultiplier = SprintMultiplier
    end

    if MaxSpeed ~= nil then
        movementComponent.MaxSpeed = MaxSpeed
    end

    if BrakingDecelerationWalking ~= nil then
        movementComponent.BrakingDecelerationWalking = BrakingDecelerationWalking
    end

    if LimitedMovementEncumbrance ~= nil then
        if LimitedMovementEncumbrance.AirControlMultiplier ~= nil then
            movementComponent.LimitedMovementEncumbrance.AirControlMultiplier = LimitedMovementEncumbrance
                .AirControlMultiplier
        end
        if LimitedMovementEncumbrance.MaxSpeedMultiplier ~= nil then
            movementComponent.LimitedMovementEncumbrance.MaxSpeedMultiplier = LimitedMovementEncumbrance
                .MaxSpeedMultiplier
        end
        if LimitedMovementEncumbrance.bJumpingSuppressed ~= nil then
            movementComponent.LimitedMovementEncumbrance.bJumpingSuppressed = LimitedMovementEncumbrance
                .bJumpingSuppressed
        end
        if LimitedMovementEncumbrance.bSprintingSuppressed ~= nil then
            movementComponent.LimitedMovementEncumbrance.bSprintingSuppressed = LimitedMovementEncumbrance
                .bSprintingSuppressed
        end
    end

    if HeavyCarryEncumbrance ~= nil then
        if HeavyCarryEncumbrance.AirControlMultiplier ~= nil then
            movementComponent.HeavyCarryEncumbrance.AirControlMultiplier = HeavyCarryEncumbrance
                .AirControlMultiplier
        end
        if HeavyCarryEncumbrance.MaxSpeedMultiplier ~= nil then
            movementComponent.HeavyCarryEncumbrance.MaxSpeedMultiplier = HeavyCarryEncumbrance
                .MaxSpeedMultiplier
        end
        if HeavyCarryEncumbrance.bJumpingSuppressed ~= nil then
            movementComponent.HeavyCarryEncumbrance.bJumpingSuppressed = HeavyCarryEncumbrance
                .bJumpingSuppressed
        end
        if HeavyCarryEncumbrance.bSprintingSuppressed ~= nil then
            movementComponent.HeavyCarryEncumbrance.bSprintingSuppressed = HeavyCarryEncumbrance
                .bSprintingSuppressed
        end
    end

    movementComponent.HeldItemEncumbranceByTier:ForEach(function(index, element)
        local el = element:get()

        if HeldItemEncumbranceByTier ~= nil then
            local encumbranceSettings = HeldItemEncumbranceByTier["Tier_" .. index]
            if encumbranceSettings ~= nil then
                if encumbranceSettings.AirControlMultiplier ~= nil then
                    el.AirControlMultiplier = encumbranceSettings.AirControlMultiplier
                end
                if encumbranceSettings.MaxSpeedMultiplier ~= nil then
                    el.MaxSpeedMultiplier = encumbranceSettings.MaxSpeedMultiplier
                end
                if encumbranceSettings.bJumpingSuppressed ~= nil then
                    el.bJumpingSuppressed = encumbranceSettings.bJumpingSuppressed
                end
                if encumbranceSettings.bSprintingSuppressed ~= nil then
                    el.bSprintingSuppressed = encumbranceSettings.bSprintingSuppressed
                end
            end
        end
    end)
end

---@param movementComponent UAstroCharacterMovementComponent
---@diagnostic disable-next-line: redundant-parameter
NotifyOnNewObject("/Script/Astro.AstroCharacterMovementComponent", function(movementComponent)
    ExecuteWithDelay(3000, function()
        ApplyMovementSettings(movementComponent)
    end)
end)

---@type UAstroCharacterMovementComponent[]?
local instances = FindAllOf("AstroCharacterMovementComponent")

if instances then
    for _, instance in pairs(instances) do
        ApplyMovementSettings(instance)
    end
end
