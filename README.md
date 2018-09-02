# mqtt_wifi_led
remote control the led with nodemcu by mqtt protocol on esp8266 
[中文文档](README_zh.md)

## features
use the mqtt protocol，support reconnection of wifi and mqtt client，control the light whth pwm 

## supported chip
esp8266 esp8285

## firmware
there is an available firmware in the firmware folder
with dht, file, gpio, http, mqtt, net, node, pwm, sjson, tmr, uart, wifi modules

## usage
 1. set the arg in config.lua

wifiLedPin --output pin
config.wifi.ssid --ssid of wifi
config.wifi.pwd --passwore of wifi
config.mqtt.* --some config related to mqtt, a mqtt broker is needed

 2. flash all the flie of the src folder into you chip then youcan control you led with mqtt

the following command can switch the light to 10, max is 100
```bash
mosquitto_pub -h mqttserver.com -t /dorm/wifiLed -m "10"
```

## 后续计划
support homekit
