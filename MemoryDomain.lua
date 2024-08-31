---@meta

---@alias GBAMemoryDomain
---| '"bios"'    BIOS     0x00000000
---| '"wram"'    EWRAM    0x02000000
---| '"iwram"'   IWRAM    0x03000000
---| '"io"'      MMIO     0x04000000
---| '"palette"' Palette  0x05000000
---| '"vram"'    VRAM     0x06000000
---| '"oam"'     OAM      0x07000000
---| '"cart0"'   ROM      0x08000000
---| '"cart1"'   ROM WS1  0x0a000000
---| '"cart2"'   ROM WS2  0x0c000000

---@alias GBMemoryDomain
---| '"cart0"'   ROM Bank $0000
---| '"vram"'    VRAM     $8000
---| '"sram"'    SRAM     $a000
---| '"wram0"'   WRAM     $c000
---| '"oam"'     OAM      $fe00
---| '"io"'      MMIO     $ff00
---| '"hram"'    HRAM     $ff80

---@class MemoryDomain
---An object used for access directly to a memory domain,
---e.g. the cartridge, instead of through a whole address space,
---as with the functions directly on [`Core`](lua://Core).
local MemoryDomain = {
    ---Get the address of the base of this memory domain
    ---@param self MemoryDomain
    ---@return integer
    base = function(self) end,

    ---Get the address of the end bound of this memory domain.
    ---Note that this address is not in the domain itself,
    ---and is the address of the first byte past it
    ---@param self MemoryDomain
    ---@return integer
    bound = function(self) end,

    ---Get a short, human-readable name for this memory domain
    ---@param self MemoryDomain
    ---@return string
    name = function(self) end,

    ---Read a 16-bit value from the given offset
    ---@param self MemoryDomain
    ---@param address integer
    ---@return integer
    read16 = function(self, address) end,

    ---Read an 32-bit value from the given offset
    ---@param self MemoryDomain
    ---@param address integer
    ---@return integer
    read32 = function(self, address) end,

    ---Read an 8-bit value from the given offset
    ---@param self MemoryDomain
    ---@param address integer
    ---@return integer
    read8 = function(self, address) end,

    ---Read byte range from the given offset
    ---@param self MemoryDomain
    ---@param address integer
    ---@param length integer
    ---@return string
    readRange = function(self, address, length) end,

    ---Get the size of this memory domain in bytes
    ---@param self MemoryDomain
    ---@return integer
    size = function(self) end,

    ---Write a 16-bit value from the given offset
    ---@param self MemoryDomain
    ---@param address integer
    ---@param value integer
    write16 = function(self, address, value) end,

    ---Write a 32-bit value from the given offset
    ---@param self MemoryDomain
    ---@param address integer
    ---@param value integer
    write32 = function(self, address, value) end,

    ---Write an 8-bit value from the given offset
    ---@param self MemoryDomain
    ---@param address integer
    ---@param value integer
    write8 = function(self, address, value) end,
}