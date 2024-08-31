---@meta

---@alias callback
---| '"alarm"' An in-game alarm went off
---| '"crashed"' The emulation crashed
---| '"frame"' The emulation finished a frame
---| '"keysRead"' The emulation is about to read the key input
---| '"reset"' The emulation has been reset
---| '"savedataUpdated"' The emulation has just finished modifying save data
---| '"sleep"' The emulation has used the sleep feature to enter a low-power mode
---| '"shutdown"' The emulation has been powered off
---| '"start"' The emulation has started
---| '"stop"' The emulation has voluntarily shut down

---@class CallbackManager
---Singleton instance of [`CallbackManager`](lua://CallbackManager)
---used for managing callbacks.
callbacks = {
    ---Add a callback of the named type.
    ---The returned id can be used to remove it later
    ---@param self CallbackManager
    ---@param callback callback
    ---@param wrapper function
    ---@return integer
    add = function(self, callback, wrapper) end,

    ---Remove a callback with the previously retuned id
    ---@param self CallbackManager
    ---@param cbid integer
    ---@return boolean
    remove = function(self, cbid) end,
}