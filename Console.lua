---@meta

---@class TextBuffer
---An object that can be used to present texual data to the user.
---It is displayed monospaced, and text can be edited after
---sending by moving the cursor or clearing the buffer.
local TextBuffer = {
    ---Advance the cursor a number of columns
    ---@param self TextBuffer
    ---@param adv integer
    advance = function(self, adv) end,

    ---Clear the buffer
    ---@param self TextBuffer
    clear = function(self) end,

    ---Get number of columns in the buffer
    ---@param self TextBuffer
    ---@return integer
    cols = function(self) end,

    ---Get the current x position of the cursor
    ---@param self TextBuffer
    ---@return integer
    getX = function(self) end,

    ---Get the current y position of the cursor
    ---@param self TextBuffer
    ---@return integer
    getY = function(self) end,

    ---Set the position of the cursor
    ---@param self TextBuffer
    ---@param x integer
    ---@param y integer
    moveCursor = function(self, x, y) end,

    ---Print a string to the buffer
    ---@param self TextBuffer
    ---@param text string
    print = function(self, text) end,

    ---Get number of rows in the buffer
    ---@param self TextBuffer
    ---@return integer
    rows = function(self) end,

    ---Set the user-visible name of this buffer
    ---@param self TextBuffer
    ---@param name string
    setName = function(self, name) end,

    ---Set the number of rows and columns
    ---@param self TextBuffer
    ---@param cols integer
    ---@param rows integer
    setSize = function(self, cols, rows) end,
}


---@class Console
---A global singleton object `console` that can be used for
---presenting textual information to the user via a console.
console = {
    ---Create a text buffer that can be used to display custom information
    ---@param self Console
    ---@param name? string
    ---@return TextBuffer
    createBuffer = function(self, name) end,

    ---Print an error to the console
    ---@param self Console
    ---@param msg string
    error = function(self, msg) end,

    ---Print a log to the console
    ---@param self Console
    ---@param msg string
    log = function(self, msg) end,

    ---Print a warning to the console
    ---@param self Console
    ---@param msg string
    warn = function(self, msg) end,
}