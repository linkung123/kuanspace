--InfoViewController
ngx.say("Information ViewController")
ngx.say("---------General----------")
local infoM = require "InfoModule"
ngx.say("http status code: ",infoM.http("status"))
--local index = "status"
--local status = infoM.http(index)
