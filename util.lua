---@meta

---@class util
---Basic utility library
util = {
    ---Expand a bitmask into a list of bit indices
    ---@param mask integer
    ---@return integer[]
    expandBitmask = function(mask) end,

    ---Compile a list of bit indices into a bitmask
    ---@param bits integer[]
    ---@return integer
    makeBitmask = function(bits) end,
}