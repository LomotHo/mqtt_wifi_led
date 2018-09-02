-- config.lua --

config = {}
config.pin = {}
config.wifi = {}
config.mqtt = {}

config.pin.dhtPin = 3
config.pin.wifiLedPin = 4
config.pin.sclk = 5
config.pin.w = 6
config.pin.t_data = 7

config.wifi.ssid="lomot-mi"
config.wifi.pwd="12344321"

config.mqtt.clientId = "dormLed_num_123456"
config.mqtt.serverUrl = "iot.lomot.cn"
config.mqtt.serverPort = 1883
config.mqtt.topic = "/dorm/wifiLed"
