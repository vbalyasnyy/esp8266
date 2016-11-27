AP_CFG={}
AP_CFG.ssid="esp"
AP_CFG.pwd="11111111"
AP_CFG.auth=AUTH_OPEN
AP_CFG.channel = 6
AP_CFG.hidden = 0
AP_CFG.max=4
AP_CFG.beacon=100

AP_IP_CFG={}
AP_IP_CFG.ip="192.168.10.1"
AP_IP_CFG.netmask="255.255.255.0"
AP_IP_CFG.gateway="192.168.10.1"

AP_DHCP_CFG ={}
AP_DHCP_CFG.start = "192.168.10.2"

wifi.setmode(wifi.SOFTAP)
wifi.setphymode(wifi.PHYMODE_N)

wifi.ap.config(AP_CFG)
wifi.ap.setip(AP_IP_CFG)

wifi.ap.dhcp.config(AP_DHCP_CFG)
wifi.ap.dhcp.start()

srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        buf = buf.."<h1> ESP8266 Web Server</h1>";
        buf = buf.."<p>LASER <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";
        --buf = buf.."<p>GPIO2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";
        local _on,_off = "",""
        if(_GET.pin == "ON1")then
            laser.on()
        elseif(_GET.pin == "OFF1")then
            laser.off()
        elseif(_GET.pin == "ON2")then
            print("ON2")
        elseif(_GET.pin == "OFF2")then
            print("OFF2")
        end
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)

