function startup()
	print('ESP8266: start test.lua')
	dofile('test.lua')
end
 
tmr.alarm(0,5000,0,startup)
