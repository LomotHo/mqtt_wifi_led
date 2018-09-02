# mqtt_wifi_led
remote control the led with nodemcu by mqtt protocol on esp8266 
( [README](README_en.md) )

## 特性
使用mqtt协议，支持wifi，mqtt断线重连，使用pwm控制led亮度

## 支持芯片
esp8266 esp8285

## 固件
firmware文件夹中有可用固件
支持dht, file, gpio, http, mqtt, net, node, pwm, sjson, tmr, uart, wifi 模块

## 使用方法
 1. 设置config.lua中的参数：

wifiLedPin --输出针脚
config.wifi.ssid --wifi的ssid
config.wifi.pwd --wifi密码
config.mqtt.* --mqtt相关设置项，需要有mqtt服务器，如果没有可以暂时使用我的 iot.lomot.cn:1883(不保证稳定性)，或者去使用其他公共平台

 2. 将src文件夹中的文件全部写入

之后可以使用mqtt控制
如以下命令将灯亮度调节到10， 最亮为100
```bash
mosquitto_pub -h mqttserver.com -t /dorm/wifiLed -m "10"
```

## 相关问题
 - 如何刷写固件

使用工具[nodemcu-pyflasher](https://github.com/marcelstoer/nodemcu-pyflasher)

 - 关于mqtt服务器搭建以及mqtt协议的知识

[这里](http://dataguild.org/?p=6817)有篇文章介绍的比较好

 - 手机控制

可以使用手机的mqtt客户端来控制，比如 MQTT dash

## 后续计划
支持homekit
