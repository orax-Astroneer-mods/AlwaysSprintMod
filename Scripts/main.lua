local modInfo = (function()
    local info = debug.getinfo(2, "S")
    local source = info.source
    return {
        name = source:match("@?.+\\Mods\\([^\\]+)"),
        file = source:sub(2),
        currentDirectory = source:match("@?(.+)\\"),
        currentModDirectory = source:match("@?(.+\\Mods\\[^\\]+)"),
        modsDirectory = source:match("@?(.+\\Mods)\\")
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
---@diagnostic disable-next-line: redundant-parameter
NotifyOnNewObject("/Script/Astro.AstroCharacterMovementComponent", function(movementComponent)
    ExecuteWithDelay(5000, function()
        if movementComponent:IsValid() and not movementComponent:IsBeingDestroyed() then
            movementComponent.SprintMultiplier = SprintMultiplier ---@diagnostic disable-line: assign-type-mismatch
            movementComponent.MaxSpeed = MaxSpeed ---@diagnostic disable-line: assign-type-mismatch
        end
    end)
end)
