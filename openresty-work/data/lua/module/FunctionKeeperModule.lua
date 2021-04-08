--Function Keeper Module
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

function _M.uriFind(string, word) --> bool
    local ok = string.match(string, word)
    if word == ok then
    	return true
    else
        return false
    end
end

function _M.delay()
    local uri = ngx.var.request_uri
    local args, err = ngx.req.get_uri_args()

    if err == "truncated" then
        -- one can choose to ignore or reject the current request here
        return
    end

    for k, v in pairs(args) do
        if k == "t" and _M.uriFind(uri, "delay") then
	    ngx.sleep(v)
	end
    end
end
return _M
