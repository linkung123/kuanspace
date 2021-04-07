local _M = {}

function _M.getKVAry(array) --> (keyAry, valueAry)
    local keyAry = {}
    local valAry = {}
    for k, v in pairs(array) do
        table.insert(keyAry, k)
	table.insert(valAry, v)
    end
    return keyAry, valAry
end

return _M
