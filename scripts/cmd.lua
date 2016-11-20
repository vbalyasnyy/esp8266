_dev_driver={}

print("### Load driver: laser");
dofile("laser.lua")
laser=_dev_driver.init(0)
--[[
print("### Load driver: hcsr04");
dofile("hcsr04.lua")
hcsr=_dev_driver.init(0, 1)

print("### Load driver: buzzer");
dofile("buzzer.lua")
buz=_dev_driver.init(0, 1)
--]]
--[[
while true do
	if hcsr.measure() > 20 then
		laser.blink(1)
	end
end
--]]
