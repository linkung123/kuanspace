local _M = {}

function _M.http(index)
    if index == "status" then
      status = ngx.HTTP_CREATED
      --ngx.status = ngx.HTTP_CREATED
      return status
    end
end

return _M
