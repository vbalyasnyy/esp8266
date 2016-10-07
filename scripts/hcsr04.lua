-- [[ D0 GPIO16 0
-- [[ D1 GPIO05 1
-- [[ D2 GPIO04 2
--dofile("hcsr04.lua")

hcsr04 = {};

function hcsr04.init(pin_trig, pin_echo)
	local self = {}
	self.time_start = 0
	self.time_end = 0
	self.trig = pin_trig or 1
	self.echo = pin_echo or 2
	gpio.mode(self.trig, gpio.OUTPUT)
	gpio.mode(self.echo, gpio.INT)

	function self.echo_cb(level)
		if level == 1 then
			self.time_start = tmr.now()
			gpio.trig(self.echo, "down")
		else
			self.time_end = tmr.now()
		end
	end

	function self.measure()
		self.time_end = 0
		gpio.trig(self.echo, "up", self.echo_cb)
		gpio.write(self.trig, gpio.HIGH)
		tmr.delay(100)
		gpio.write(self.trig, gpio.LOW)
		tmr.delay(100000)
		local waiter = 0
		while (self.time_end == 0) and (waiter < 58*20) do
		--while self.time_end == 0 do
			tmr.delay(10)
			waiter=waiter+1
		end
		tmr.delay(10)
		if (self.time_end - self.time_start) < 0 then
			return -1
		end
		ret = (self.time_end - self.time_start) / 58
		return ret
	end
	return self
end

dev = hcsr04.init(6, 5)

