print("### HELLO ###")

wifi.setmode(wifi.STATION)
wifi.sta.disconnect()
wifi.setmode(wifi.SOFTAP)
wifi.sta.disconnect()
wifi.sleeptype(wifi.NONE_SLEEP)
wifi.ap.config({ssid="ESP8266",pwd="12345678"})
wifi.ap.setip({ip="192.168.1.1",netmask="255.255.255.0",gateway="192.168.1.1"})
wifi.setmode(wifi.SOFTAP)
--collectgarbage();
print("### END ###")

srv=nil
collectgarbage();
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
        conn:on("receive",function(conn,request)
                --print(request)
		t_now = tmr.time()
		--len = measure_HC_SR04(trigger,echo)
                --conn:send("<h1> NodeMCU TIME: "..t_now.." MEASURE: "..len.."</h1>")
		local dist = 0
		local send_str="<html><head><title>NodeMCU</title> \
				<meta http-equiv=\"refresh\" content=\"10\" /> \
				</head><body> \
				<h1> NodeMCU <br>TIME: "..t_now.."<br>LEN: "..dist.."</h1> \
				</body></html>"
                conn:send(send_str)
		tmr.delay(3000)
        end)
        conn:on("sent",function(conn)
		conn:close()
        end)
end)
--tmr.alarm(0, 3000, 1, function() print("esp...") end )

