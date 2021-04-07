--Information Module
local _M = {}

function _M.http(index)
    --http code, -> string
    if index == "status" then
        local status = ngx.HTTP_CREATED
        --ngx.status = ngx.HTTP_CREATED
        return status
    end

    --http version, -> string
    if index == "version" then
        local version = ngx.req.http_version()
	return version
    end

    --origin ip, -> string
    if index == "origin_ip" then
        local ip = ngx.var.remote_addr
	return ip
    end
end

function _M.https(index)
    --https tls version, -> string
    if index == "tls_version" then
        local scheme = ngx.var.scheme
        if scheme == "https" then
            local ssl = require "ngx.ssl"
            local protocol, err = ssl.get_tls1_version_str()
            return protocol
        else
	    return "nil"
        end
    end
end

function _M.req(index)
    --get request uri, -> string
    if index == "uri" then
        local uri = ngx.var.request_uri
	return uri
    end

    --get request method, -> string
    if index == "get_method" then
        local method = ngx.req.get_method()
	return method
    end

    --get request header, -> table{table, table}
    if index == "get_headers" then
        local headers, err = ngx.req.get_headers()
        if err == "truncated" then
            -- one can choose to ignore or reject the current request here
            return
        end
        return headers
    end
end

function _M.resp(index)
    --get response headers
    if index == "get_headers" then
        local headers, err = ngx.resp.get_headers()
	if err == "truncated" then
            -- one can choose to ignore or reject the current request here
            return
        end
	return headers
    end
end

return _M
