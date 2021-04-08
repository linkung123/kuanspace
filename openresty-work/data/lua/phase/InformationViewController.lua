--InfoViewController
ngx.say("Information ViewController")
local default = require "DefaultSetupModule"
default.setup()

ngx.say()
ngx.say("---------General----------")
local info = require "InformationModule"
ngx.say("http status code: ",info.http("status"))
ngx.say("http protocol: ",info.http("version"))
ngx.say("https: ",info.https("tls_version"))
ngx.say("url: ",info.req("uri"))
ngx.say("get method: ",info.req("get_method"))
ngx.say("origin ip: ",info.http("origin_ip"))

ngx.say()
ngx.say("-----Request Headers------")
local headers = info.req("get_headers")
for k, v in pairs(headers) do
    ngx.say(k..": "..v)
end

ngx.say("-------Request args-------")
local args = info.req("get_args")
for k, v in pairs(args) do
    if type(v) == "table" then
        ngx.say(k, ": ", table.concat(val, ", "))
    else
        ngx.say(k, ": ", v)
    end
end

ngx.say()
ngx.say("-----Response Headers-----")
local headers = info.resp("get_headers")
for k, v in pairs(headers) do
    ngx.say(k..": "..v)
end
ngx.say("sever: ",info.resp("sever_version"))
