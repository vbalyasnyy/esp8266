WIFI_SSID = "wifi"
WIFI_PASSWORD = "password"
WIFI_SIGNAL_MODE = wifi.PHYMODE_N

ESP8266_IP=""
ESP8266_NETMASK=""
ESP8266_GATEWAY=""

wifi.setmode(wifi.STATION) 
wifi.setphymode(WIFI_SIGNAL_MODE)
wifi.sta.config(WIFI_SSID, WIFI_PASSWORD) 
wifi.sta.connect()

if ESP8266_IP ~= "" then
 wifi.sta.setip({ip=ESP8266_IP,netmask=ESP8266_NETMASK,gateway=ESP8266_GATEWAY})
end

local function wifi_wait_ip()  
	if wifi.sta.getip()== nil then
		print("IP unavailable, Waiting...")
	else
		tmr.stop(1)
		print("IP: "..wifi.sta.getip())
	end
end

tmr.alarm(1, 2500, 1, wifi_wait_ip)
