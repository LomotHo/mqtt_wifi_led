-- init.lua --

require("config")

gpio.mode(config.pin.wifiLedPin,gpio.OUTPUT)
gpio.write(config.pin.wifiLedPin,gpio.LOW)

print('\nStart the configuration in connect\n')
wifi.setmode(wifi.STATION)
wifi.sta.config(config.wifi)
wifi.sta.autoconnect(1)

tmr.alarm(0, 1000, tmr.ALARM_SEMI, function()
   if wifi.sta.getip() == nil then
        print("Connecting to AP...\n")
        tmr.start(0)
   else
        ip, nm, gw=wifi.sta.getip()
        print("IP Info: \nIP Address: ",ip)
        print("Netmask: ",nm)
        print("Gateway Addr: ",gw,'\n')
        tmr.unregister(0)
        -- Run the main file
        dofile("main.lua")
    end
end)

-- file.remove('init.lua')
