m = mqtt.Client("client_id", 120, "login", "password")
m:on("connect", function(con) print ("connected") end)
m:on("offline", function(con) print ("offline") end)

m:on("message", function(conn, topic, data)
	if data == nil then
		print(topic .. ":" .. data)
	end
	
	if topic == "laser" then
		if data == "on" then laser.on()
		elseif data == "off" then laser.off()
		else print(topic .. ":" .. data)
		end
	elseif topic == "buzzer" then
		if data == "a" then buz.play(data, 1)
		elseif data == "b" then buz.play(data, 1)
		elseif data == "c" then buz.play(data, 1)
		elseif data == "d" then buz.play(data, 1)
		elseif data == "e" then buz.play(data, 1)
		elseif data == "f" then buz.play(data, 1)
		elseif data == "g" then buz.play(data, 1)
		elseif data == "C" then buz.play(data, 1)
		else print(topic .. ":" .. data)
		end
	else
		print(topic .. ":" .. data)
	end
end)

m:connect("xxx.cloudmqtt.com", xxxx, 0, function(conn) 
  print("connected")
  m:subscribe("laser",0, function(conn) print("subscribe: laser") end)
  m:subscribe("buzzer",0, function(conn) print("subscribe: buzzer") end)
end)
