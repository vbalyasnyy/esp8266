-- [[ D1 GPIO05 1
-- [[ D2 GPIO04 2

trigger = 1
echo = 2

gpio.mode(trigger,gpio.OUTPUT)
gpio.mode(echo,gpio.INPUT)

function measure_HC_SR04(trigger, echo)
	gpio.write(trigger, gpio.LOW)
	dist = 0
	for variable = 0, 200, 1 do
		dist = dist + gpio.read(echo)
	end
	gpio.write(trigger, gpio.HIGH)
	return dist
end

tmr.alarm(1,250,1,function()
	dist = measure_HC_SR04(trigger,echo)
	print (dist)
end)

