--wifi.setmode(wifi.STATIONAP)
--wifi.sta.config("testpoint","")
-- wifi.sta.connect()
--wifi.sta.setip({ip="192.168.1.4",netmask="255.255.255.0",gateway="192.168.1.1"})


wifi.setmode(wifi. STATIONAP) -- set mode to station access point
wifi.ap.config({ssid= "espha", pwd="11111111"}) -- configure own SSID as ‘ESP_TEST’ and password of ‘123456789’
wifi.ap.setip({ip="192.168.1.4",netmask="255.255.255.0",gateway="192.168.1.1"})

print("ESP8266 mode is: " .. wifi.getmode())
print("The module MAC address is: " .. wifi.ap.getmac())
print("Config done, IP is " .. wifi.ap.getip())

srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
	conn:on("receive",function(conn,request)
		print(request)
		conn:send("<h1> Hello, NodeMcu.</h1>")
	end)
	conn:on("sent",function(conn) conn:close() end)
end)


--[[
lighton=0
tmr.alarm(0,1000,1,function() -- Timer will be 1 second
if lighton==0 then
	lighton=1
	led(512,512,512) -- 512/1024, 50% duty cycle
else
	lighton=0
	led(0,0,0)
end
end)
]]
