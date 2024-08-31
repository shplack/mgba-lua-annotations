---@meta

local SOCKERR = {
    UNKNOWN_ERROR = "unknown error",
    OK = "ok",
    AGAIN = "temporary failure",
    ADDRESS_IN_USE = "address in use",
    CONNECTION_REFUSED = "connection refused",
    DENIED = "access denied",
    FAILED = "failed",
    NETWORK_UNREACHABLE = "network unreachable",
    NOT_FOUND = "not found",
    NO_DATA = "no data",
    OUT_OF_MEMORY = "out of memory",
    TIMEOUT = "timeout",
    UNSUPPORTED = "unsupported"
}

---@class socket
---An instance of a TCP socket
---Most of these functions will return two values if an error occurs;
---the first value is `nil` and the second value is an error `string`
---from [`socket.ERRORS`](lua://socket.ERRORS).
local _socket = {
    ---Creates a new socket for an incoming connection from a listening server socket
    ---@param self socket
    ---@return socket socket
    accept = function(self) end,

    ---Add a callback for a named event.
    ---The returned id can be used to remove it later.
    ---Events get checked once per frame but can be checked
    ---manually using [`socket::poll`](lua://socket.poll)
    ---@param self socket
    ---@param event string Named callback event
    ---| '"received"' New data has been received and can be read
    ---| '"error"' An error has occurred on the socket
    ---@param callback function Callback function
    ---@return integer callbackId
    add = function(self, event, callback) end,

    ---Bind the socket to a specific interface and port.
    ---Use `nil` for `address` to bind to all interfaces
    ---@param self socket
    ---@param address? string host
    ---@param port integer
    ---@return integer
    bind = function(self, address, port) end,

    ---Opens a TCP connection to the specified address and port.
    ---**Caution**: This is a blocking call.
    ---The emulator will not respond until the connection either succeeds or fails
    ---@param self socket
    ---@param address string
    ---@param port integer
    ---@return integer
    connect = function(self, address, port) end,

    ---Check if a socket has data ready to receive, and return true if so
    ---@param self socket
    ---@return boolean
    hasdata = function(self) end,

    ---Begins listening for incoming connections.
    ---The socket must have first been bound with the
    ---[`socket::bind`](lua://socket.bind) function
    ---@param self socket
    ---@param backlog? integer `default=1`
    ---@return integer
    listen = function(self, backlog) end,

    ---Manually check for events on this socket and dispatch associated callbacks
    ---@param self socket
    poll = function(self) end,

    ---Read up to `maxBytes` bytes from the socket and return them.
    ---If the socket has been disconnected or an error occurs,
    ---it will return `nil, error` instead
    ---@param self socket
    ---@param maxBytes integer
    ---@return string | nil, string data
    receive = function(self, maxBytes) end,

    ---Remove a callback with the previously returned id
    ---@param self socket
    ---@param cbid integer callback ID
    remove = function(self, cbid) end,

    ---Writes a string to the socket.
    ---If `i` and `j` are provided, they have the same semantics
    ---as the parameters to [`string.sub`](lua://string.sub) to write a substring
    ---@param self socket
    ---@param data string
    ---@param i? integer `default=0`
    ---@param j? integer `default=0`
    ---@return integer index Last index written
    send = function(self, data, i, j) end,
}


socket = {
    ---Create and bind a new socket to a specific interface and port.
    ---Use `nil` for address to bind to all interfaces
    ---@param address? string
    ---@param port integer
    ---@return socket socket
    bind = function(address, port) end,

    ---Create and return a new TCP socket with a connection
    ---to the specified address and port.
    ---Caution: This is a blocking call.
    ---The emulator will not respond until the connection either succeeds or fails
    ---@param address string
    ---@param port integer
    ---@return socket socket
    connect = function(address, port) end,

    ---Create a new TCP socket, for use with either
    ---[`socket::bind`](lua://socket.bind) or
    ---[`socket::connect`](lua://socket.connect) later
    ---@param self socket
    ---@return socket socket
    tcp = function(self) end,

    ---@class socket.ERRORS
    ---Error strings corresponding to the
    ---[`C.SOCKERR`](lua://C.SOCKERR) error codes,
    ---indexed both by name and by value
    ERRORS = {
        [-1] = SOCKERR.UNKNOWN_ERROR,
        [0] = SOCKERR.OK,
        [1] = SOCKERR.AGAIN,
        [2] = SOCKERR.ADDRESS_IN_USE,
        [3] = SOCKERR.CONNECTION_REFUSED,
        [4] = SOCKERR.DENIED,
        [5] = SOCKERR.FAILED,
        [6] = SOCKERR.NETWORK_UNREACHABLE,
        [7] = SOCKERR.NOT_FOUND,
        [8] = SOCKERR.NO_DATA,
        [9] = SOCKERR.OUT_OF_MEMORY,
        [10] = SOCKERR.TIMEOUT,
        [11] = SOCKERR.UNSUPPORTED,
        UNKNOWN_ERROR = SOCKERR.UNKNOWN_ERROR,
        OK = SOCKERR.OK,
        AGAIN = SOCKERR.AGAIN,
        ADDRESS_IN_USE = SOCKERR.ADDRESS_IN_USE,
        CONNECTION_REFUSED = SOCKERR.CONNECTION_REFUSED,
        DENIED = SOCKERR.DENIED,
        FAILED = SOCKERR.FAILED,
        NETWORK_UNREACHABLE = SOCKERR.NETWORK_UNREACHABLE,
        NOT_FOUND = SOCKERR.NOT_FOUND,
        NO_DATA = SOCKERR.NO_DATA,
        OUT_OF_MEMORY = SOCKERR.OUT_OF_MEMORY,
        TIMEOUT = SOCKERR.TIMEOUT,
        UNSUPPORTED = SOCKERR.UNSUPPORTED
    }
}