device={}
device.api={}
local dev_type={"hcsr-04", "motor-130"}

function device:set_type(val)
	for type_id=1, #dev_type do
		if dev_type[type_id] == val then
			--print("DEBUG:", dev_type[type_id], val);
			self.type = dev_type[type_id]
		end
	end
	if self.type == nil then
		print("ERROR: Device type \""..val.."\" unsupported!!!");
		for type_idx=1, #dev_type do
			print("<"..dev_type[type_idx]..">")
		end
	end
end
function device:set_name(val)
	self.name=val
end
--debug.getinfo(1, "n").name
function device:add_api(name, func)
	--check parameters
	if (type(name) ~= "string") then
		print("ERROR: set_api() first parameter is not a string ("..type(name)..")!!!")
		return -1
	end
	if (type(func) ~= "function") then
		print("ERROR: set_api() second parameter is not a function ("..type(func)..")!!!")
		return -1
	end
	--add api function and description
	self.api[name]=func
end

function device:info()
	print("### DEVICE INFO ###")
	print("NAME:", self.name)
	print("TYPE:", self.type)
	print("API:", self.type)
	for name, func in pairs(device.api) do
		print(name)
		print(func())
	end
end

device:set_name("HCSR1");
device:set_type("hcsr-04");

function get_distance()
	print("GET distance from HCSR-04: 00m")
end
device:add_api("get_distance", get_distance);
device:info()

device.api:get_distance()

