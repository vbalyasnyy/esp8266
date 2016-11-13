_dev_driver={}

dofile("laser.lua")
laser=_dev_driver.init(5)
dofile("hcsr04.lua")
hcsr=_dev_driver.init(0, 1)
dofile("buzzer.lua")
buz=_dev_driver.init(0, 1)

while hcsr.measure() > 20 do
	laser.blink(1)
end
