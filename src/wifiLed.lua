
require("config")

wifiLed = {}


function wifiLed.init()
	pwm.setup(config.pin.wifiLedPin,500,255) 
	pwm.start(config.pin.wifiLedPin) 
	pwm.setduty(config.pin.wifiLedPin,0)
end


function wifiLed.setLight(data)
	data = tonumber(data)
	if (data ~= nil and data <= 100 and data >= 0) then
    	pwm.setduty(config.pin.wifiLedPin, data*5)  
	else 
	    print("light data nil")
	end
end

