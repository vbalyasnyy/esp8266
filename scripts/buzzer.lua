buzzer = {}
--[[
https://www.arduino.cc/en/Tutorial/PlayMelody
 * timeHigh = 1/(2 * toneFrequency) = period / 2
 * note         frequency       period  PW (timeHigh)  
 * c            261 Hz          3830    1915    
 * d            294 Hz          3400    1700    
 * e            329 Hz          3038    1519    
 * f            349 Hz          2864    1432    
 * g            392 Hz          2550    1275    
 * a            440 Hz          2272    1136    
 * b            493 Hz          2028    1014   
 * C            523 Hz          1912    956
--]]

function buzzer.init(pin)
	local self = {}
	self.pin = pin
	self.freq = 100
	self.state = 0
	function self.tone(freq)
		self.freq = freq
		pwm.setup(self.pin, self.freq, 512)
	end
	function self.play(sec)
		pwm.start(self.pin)
		tmr.delay(sec*1000000)
		pwm.stop(self.pin)
	end

	self.tone(self.freq)
	return self
end

buz=buzzer.init(1)
