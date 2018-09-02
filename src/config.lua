-- config.lua --

config = {}
config.pin = {}
config.wifi = {}
config.mqtt = {}

-- config.pin.dhtPin = 3
config.pin.wifiLedPin = 4

config.wifi.ssid="ssid"
config.wifi.pwd="password"

config.mqtt.clientId = "dormLed_id_123456"
config.mqtt.serverUrl = "mqttserver.com"
config.mqtt.serverPort = 1883
config.mqtt.topic = "/dorm/wifiLed"
