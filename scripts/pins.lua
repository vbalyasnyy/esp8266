pinmap={
--hw_pin comment hw_name sw_pin
[0]={"COMMENT","HW NAME","SW PIN", "DEVICE"},
{"ADC0",	"A0",	-1},
{"GND",		"G",	-1},
{"VU",		"VU",	-1},
{"GPIO10",	"SD3",	12},
{"GPIO9",	"SD2",	11},
{"MOSI",	"SD1",	-1},
{"CS",		"CMD",	-1},
{"MISO",	"SD0",	-1},
{"SCLK",	"CLK",	-1},
{"GND",		"GND",	-1},
{"3.3V",	"3V3",	-1},
{"EN",		"EN",	-1},
{"RST",		"RST",	-1},
{"GND",		"GND",	-1},
{"Vin",		"Vin",	-1},
{"GPIO16",	"D0",	0},
{"GPIO5",	"D1",	1},
{"GPIO4",	"D2",	2},
{"GPIO0",	"D3",	3},
{"GPIO2",	"D4",	4},
{"3.3V",	"3V3",	-1},
{"GND",		"GND",	-1},
{"GPIO14",	"D5",	5},
{"GPIO12",	"D6",	6},
{"GPIO13",	"D7",	7},
{"GPIO15",	"D8",	8},
{"GPIO3",	"RX",	9},
{"GPIO1",	"TX",	10},
{"GND",		"GND",	-1},
{"3.3V",	"3V3",	-1},
}

function show_pinmap()
	print("### PIN MAP ###")
	local header=pinmap[0]
	print(header[1], header[2], header[3], header[4])		--table header
	for hwpin=1, #pinmap do
		local pin=pinmap[hwpin]
		if string.sub(pin[1], 0, 4) == "GPIO" then		--print only GPIO
			if pin[4] ~= nil then
				print(pin[1], pin[2], pin[3], pin[4])	--device set
			else
				print(pin[1], pin[2], pin[3])
			end
		end
	end
end

function set_pin(dev, ...)
	for swpin=1, arg.n do
		for hwpin=1, #pinmap do
			local pin = pinmap[hwpin]
			if pin[3] == swpin then
				pin[4] = dev
			end
		end
	end
end

set_pin("hcsr-04", 2, 7)
show_pinmap()

