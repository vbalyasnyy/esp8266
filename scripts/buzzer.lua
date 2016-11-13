--buzzer = {}

function _dev_driver.init(pin)
	local self = {}
	self.pin = pin
	self.freq = 100
	self.state = 0
	function self.settone(freq)
		self.freq = freq
		pwm.setup(self.pin, self.freq, 512)
		pwm.stop(self.pin)
	end
	function self.playtone(sec)
		pwm.start(self.pin)
		tmr.delay(sec*1000000)
		pwm.stop(self.pin)
	end

	function self.play(note, time)
		if note=="c" then self.settone(261) self.playtone(time)
		elseif note=="d" then self.settone(294) self.playtone(time)
		elseif note=="e" then self.settone(329) self.playtone(time)
		elseif note=="f" then self.settone(349) self.playtone(time)
		elseif note=="g" then self.settone(392) self.playtone(time)
		elseif note=="a" then self.settone(440) self.playtone(time)
		elseif note=="b" then self.settone(493) self.playtone(time)
		elseif note=="C" then self.settone(523) self.playtone(time)
		end
	end

	self.settone(self.freq)
	return self
end

--buz=buzzer.init(1)
