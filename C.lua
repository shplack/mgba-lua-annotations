---@meta

---A table containing the exported constants
---@enum C
C = {
    ---@enum
    CHECKSUM = {
        CRC32 = 0
    },

    ---@enum
    GBA_KEY = {
        A = 0,
        B = 1,
        SELECT = 2,
        START = 3,
        RIGHT = 4,
        LEFT = 5,
        UP = 6,
        DOWN = 7,
        R = 8,
        L = 9
    },

    ---@enum
    GB_KEY = {
        A = 0,
        B = 1,
        SELECT = 2,
        START = 3,
        RIGHT = 4,
        LEFT = 5,
        UP = 6,
        DOWN = 7
    },

    ---@enum
    PLATFORM = {
        NONE = -1,
        GBA = 0,
        GB = 1
    },

    ---@enum
    SAVESTATE = {
        SCREENSHOT = 1,
        SAVEDATA = 2,
        CHEATS = 4,
        RTC = 8,
        METADATA = 16,
        ALL = 31
    },

    ---@enum
    SOCKERR = {
        UNKNOWN_ERROR = -1,
        OK = 0,
        AGAIN = 1,
        ADDRESS_IN_USE = 2,
        CONNECTION_REFUSED = 3,
        DENIED = 4,
        FAILED = 5,
        NETWORK_UNREACHABLE = 6,
        NOT_FOUND = 7,
        NO_DATA = 8,
        OUT_OF_MEMORY = 9,
        TIMEOUT = 10,
        UNSUPPORTED = 11
    }
}