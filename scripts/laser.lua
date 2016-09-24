laser = {}

function laser.init(pin)
	local self = {}
	self.pin = pin
	self.freq = 0
	self.state = "off"
	
	gpio.mode(self.pin, gpio.OUTPUT)

	function self.setup(freq)
		self.freq = freq
		if self.freq ~= 0 then
			pwm.setup(self.pin, self.freq, 512)
		end
	end
	function self.blink(sec)
		self.on()
		tmr.delay(sec*1000000)
		self.off()
	end
	function self.on()
		if self.freq ~=0 then
			pwm.start(self.pin)
		else
			gpio.write(self.pin, gpio.HIGH)
		end
	end
	function self.off()
		if self.freq ~=0 then
			pwm.stop(self.pin)
		else
			gpio.write(self.pin, gpio.LOW)
		end
	end

	self.tone(self.freq)
	return self
end

las=laser.init(1)
