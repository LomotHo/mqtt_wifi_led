-- main.lua --

require("config")
require("mqttClient")
require("wifiLed")


function main()
	wifiLed.init()

    mqttClient.start(x, function(mqttData)
    	wifiLed.setLight(mqttData)
    end)

end
main()
