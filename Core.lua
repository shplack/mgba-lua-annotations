---@meta

---@alias GameKey
---| C.GB_KEY
---| C.GBA_KEY

---@class Core
---An instance of an emulator core.
local Core = {
    ---Add a single key to the currently active key list
    ---@param self Core
    ---@param key GameKey
    addKey = function(self, key) end,

    ---Add a bitmask of keys to the currently active key list
    ---@param self Core
    ---@param keys integer
    addKeys = function(self, keys) end,

    ---Load the save data associated with the currently loaded ROM file
    ---@param self Core
    ---@return boolean success
    autoloadSave = function(self) end,

    ---Get the checksum of the loaded ROM
    ---@param self Core
    ---@param type? integer
    ---@return string checksum
    checksum = function(self, type) end,

    ---Remove a single key from the currently active key list
    ---@param self Core
    ---@param key GameKey
    clearKey = function(self, key) end,

    ---Remove a bitmask of keys from the currently active key list
    ---@param self Core
    ---@param keys integer
    clearKeys = function(self, keys) end,

    ---Get the number of the current frame
    ---@param self Core
    ---@return integer frame
    currentFrame = function(self) end,

    ---Get the number of cycles per frame
    ---@param self Core
    ---@return integer cycles
    frameCycles = function(self) end,

    ---Get the number of cycles per second
    ---@param self Core
    ---@return integer frequency
    frequency = function(self) end,

    ---Get internal product code for the game from the ROM header, if available
    ---@param self Core
    ---@return string code
    getGameCode = function(self) end,

    ---Get internal title of the game from the ROM header
    ---@param self Core
    ---@return string title
    getGameTitle = function(self) end,

    ---Get the active state of a given key
    ---@param self Core
    ---@param key GameKey
    ---@return 0 | 1 key
    getKey = function(self, key) end,

    ---Get the currently active keys as a bitmask
    ---@param self Core
    ---@return integer keys
    getKeys = function(self) end,

    ---Load a ROM file into the current state of this core
    ---@param self Core
    ---@param path string
    ---@return boolean success
    loadFile = function(self, path) end,

    ---Load save data from the given path.
    ---If the `temporary` flag is set,
    ---the given save data will not be written back to disk
    ---@param self Core
    ---@param path string
    ---@param temporary boolean
    ---@return boolean success
    loadSaveFile = function(self, path, temporary) end,

    ---Load state from a buffer
    ---@param self Core
    ---@param buffer string
    ---@param flags? integer
    ---@return boolean success
    ---@see C.SAVESTATE for possible values for `flags`
    loadStateBuffer = function(self, buffer, flags) end,

    ---Load state from the given path
    ---@param self Core
    ---@param path string
    ---@param flags? integer
    ---@return boolean success
    ---@see C.SAVESTATE for possible values for `flags`
    loadStateFile = function(self, path, flags) end,

    ---Load state from the slot number
    ---@param self Core
    ---@param slot integer
    ---@param flags? integer
    ---@return boolean success
    ---@see C.SAVESTATE for possible values for `flags`
    loadStateSlot = function(self, slot, flags) end,

    ---Get which platform is being emulated
    ---@param self Core
    ---@return C.PLATFORM platform
    ---@see C.PLATFORM for possible values
    platform = function(self) end,

    ---Read a 16-bit value from the given bus address
    ---@param self Core
    ---@param address integer
    ---@return integer value
    read16 = function(self, address) end,

    ---Read a 32-bit value from the given bus address
    ---@param self Core
    ---@param address integer
    ---@return integer value
    read32 = function(self, address) end,

    ---Read an 8-bit value from the given bus address
    ---@param self Core
    ---@param address integer
    ---@return integer value
    read8 = function(self, address) end,

    ---Read byte range from the given offset
    ---@param self Core
    ---@param address integer
    ---@param length integer
    ---@return string range
    readRange = function(self, address, length) end,

    ---Read the value of the register with the given name
    ---@param self Core
    ---@param regName RegisterName
    ---@return integer value
    readRegister = function(self, regName) end,

    ---Reset the emulation.
    ---This does not invoke the `reset` callback
    ---@param self Core
    reset = function(self) end,

    ---Get the size of the loaded ROM
    ---@param self Core
    ---@return integer size
    romSize = function(self) end,

    ---Run until the next frame
    ---@param self Core
    runFrame = function(self) end,

    ---Save state and return as a buffer
    ---@param self Core
    ---@param flags? integer
    ---@return string success
    ---@see C.SAVESTATE for possible values for `flags`
    saveStateBuffer = function(self, flags) end,

    ---Save state to the given path
    ---@param self Core
    ---@param path string
    ---@param flags? integer
    ---@return boolean success
    ---@see C.SAVESTATE for possible values for `flags`
    saveStateFile = function(self, path, flags) end,

    ---Save state to the slot number
    ---@param self Core
    ---@param slot integer
    ---@param flags? integer
    ---@return boolean success
    ---@see C.SAVESTATE for possible values for `flags`
    saveStateSlot = function(self, slot, flags) end,

    ---Save a screenshot
    ---@param self Core
    ---@param filename? string
    screenshot = function(self, filename) end,

    ---Set the currently active key list
    ---@param self Core
    ---@param keys integer
    setKeys = function(self, keys) end,

    ---Run a single instruction
    ---@param self Core
    step = function(self) end,

    ---Write a 16-bit value from the given bus address
    ---@param self Core
    ---@param address integer
    ---@param value integer
    write16 = function(self, address, value) end,

    ---Write a 32-bit value from the given bus address
    ---@param self Core
    ---@param address integer
    ---@param value integer
    write32 = function(self, address, value) end,

    ---Write an 8-bit value from the given bus address
    ---@param self Core
    ---@param address integer
    ---@param value integer
    write8 = function(self, address, value) end,

    ---Write the value of the register with the given name
    ---@param self Core
    ---@param regName RegisterName
    ---@param value integer
    writeRegister = function(self, regName, value) end
}


---@class CoreAdapter: Core
---A wrapper around a [`Core`](lua://Core) object that exposes more functionality.
---It can be implicity cast to a [`Core`](lua://Core) object,
---and exposes the same methods.
---@see Core
emu = {
    ---Reset the emulation.
    ---As opposed to [`Core.reset`](lua://Core.reset),
    ---this version calls the [`reset`](lua://callback) callback
    ---@param self CoreAdapter
    reset = function(self) end,

    ---A table containing a platform-specific set of
    ---[`MemoryDomain`](lua://MemoryDomain) objects
    ---@type table<GBAMemoryDomain | GBMemoryDomain, MemoryDomain>
    memory = nil
}