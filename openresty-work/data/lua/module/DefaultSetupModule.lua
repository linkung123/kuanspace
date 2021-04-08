--Default Setup Module
local _M = {}

function _M.setup()
    local keeper = require "FunctionKeeperModule"
    keeper.delay()
end

return _M
