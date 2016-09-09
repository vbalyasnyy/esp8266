function set(a, b) pwm.close(1) pwm.setup(1, a, b) pwm.start(1) end

set(10, 512) tmr.delay(100000) set(100, 512) tmr.delay(100000) set(1000, 512) tmr.delay(100000) pwm.close(1)

function acc(time, step, wide)
		for freq=step,1000,1000/step do
			pwm.close(1)
			pwm.setup(1, freq, (1023*wide)/100)
			pwm.start(1)
			#print(freq)
			tmr.delay(time*1000000/step)
		end
		pwm.close(1)
	end


left=1
right=2

gpio.mode(0, gpio.OUTPUT)
gpio.mode(1, gpio.OUTPUT)
gpio.mode(2, gpio.OUTPUT)
gpio.mode(3, gpio.OUTPUT)
gpio.mode(4, gpio.OUTPUT)
gpio.mode(5, gpio.OUTPUT)

gpio.write(0, gpio.LOW)
gpio.write(1, gpio.LOW)
gpio.write(2, gpio.LOW)
gpio.write(3, gpio.LOW)
gpio.write(4, gpio.LOW)
gpio.write(5, gpio.LOW)

gpio.write(0, gpio.HIGH)
gpio.write(1, gpio.HIGH)
gpio.write(2, gpio.HIGH)
gpio.write(3, gpio.HIGH)
gpio.write(4, gpio.HIGH)
gpio.write(5, gpio.HIGH)

