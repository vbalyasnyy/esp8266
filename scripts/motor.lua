
motor = {};

function motor.init(Pleft, Prigth, Cleft, Crigth)
	local self = {};
	self.speed_max = 10;
	self.Pleft=Pleft;
	self.Cleft=Cleft;
	self.Prigth=Prigth;
	self.Crigth=Crigth;

	gpio.mode(self.Pleft, gpio.OUTPUT)
	gpio.mode(self.Prigth, gpio.OUTPUT)
	gpio.mode(self.Cleft, gpio.OUTPUT)
	gpio.mode(self.Crigth, gpio.OUTPUT)

	function self.start() pwm.start(self.Pleft) pwm.start(self.Prigth) end
	function self.stop() pwm.stop(self.Pleft) pwm.stop(self.Prigth)
			gpio.write(self.Pleft, gpio.LOW) gpio.write(self.Prigth, gpio.LOW) end
	function self.move(time)
		self.start()
		tmr.delay(time);
		self.stop()
	end

	function self.left() gpio.write(self.Cleft, gpio.HIGH) gpio.write(self.Crigth, gpio.HIGH) end
	function self.rigth() gpio.write(self.Cleft, gpio.LOW) gpio.write(self.Crigth, gpio.LOW) end
	function self.forward() gpio.write(self.Cleft, gpio.HIGH) gpio.write(self.Crigth, gpio.LOW) end
	function self.back() gpio.write(self.Cleft, gpio.LOW) gpio.write(self.Crigth, gpio.HIGH) end
	function self.rotate(direct)
		if direct == "left" then self.left()
		elseif direct == "rigth" then self.rigth()
		elseif direct == "forward" then self.forward()
		elseif direct == "back" then self.back()
		else print("#DBG# motor.rotate: bad value")
		end
	end

	function self.pwm(freq, duty)
		pwm.setup(self.Pleft, freq, duty)
		pwm.setup(self.Prigth, freq, duty)
	end

	function self.speed(sp)
		if sp < 1 and sp > self.speed_max then
			print("#DBG# motor.speed: bad value, 1-"..motor.speed_max.." range")
			return
		end
		local freq = sp*1000/self.speed_max
		local duty = 256*3
		self.pwm(freq, duty)
	end

	function self.test()
		local speed = self.speed
		self.speed(10)
		self.rotate("forward") self.move(1000000) tmr.delay(1000000)
		self.rotate("back") self.move(1000000) tmr.delay(1000000)
		self.rotate("left") self.move(1000000) tmr.delay(1000000)
		self.rotate("rigth") self.move(1000000) tmr.delay(1000000)
		tmr.delay(5000000)
		self.rotate("forward") self.move(1000000) tmr.delay(1000000)
		self.rotate("rigth") self.move(1000000) tmr.delay(1000000)
		self.rotate("forward") self.move(1000000) tmr.delay(1000000)
		self.rotate("rigth") self.move(1000000) tmr.delay(1000000)
		self.rotate("forward") self.move(1000000) tmr.delay(1000000)
		self.rotate("rigth") self.move(1000000) tmr.delay(1000000)
		self.rotate("forward") self.move(1000000) tmr.delay(1000000)
		self.rotate("rigth") self.move(1000000) tmr.delay(1000000)
		self.speed(speed)
	end

	self.speed(5)
	self.rotate("forward")
	return self
end

function motor.test()
        print("MOTOR ON");

        period=1000000
        freq=100
        duty=512

        motor_forward()
        motor_pwm(freq, duty)
        motor_start()
        tmr.delay(period)
        motor_stop()

        tmr.delay(period)

        motor_left()
        motor_pwm(freq, duty)
        motor_start()
        tmr.delay(period)
        motor_stop()
end

dev = motor.init(1,2,3,4)
