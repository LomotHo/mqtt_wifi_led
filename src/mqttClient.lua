-- mqtt

require("config")

mqttClient = {}

m = mqtt.Client(config.mqtt.clientId, 120)


local function afterMqttConnected(client)
    print("connected")
    client:subscribe(config.mqtt.topic, 1, function(client) 
        print("subscribe success, topic: " .. config.mqtt.topic) 
    end)
    -- local publishTimer = tmr.create()
    -- publishTimer:register(5000, tmr.ALARM_AUTO, function (t) 
    --     local status, temp, humi , temp_dec, humi_dec = dht.read11(config.pin.dhtPin)
    --     print("temp: "..temp.."."..temp_dec)
    --     client:publish("/dorm/temp", temp.."."..temp_dec, 0, 0)
    --     client:publish("/dorm/humi", humi.."."..humi_dec, 0, 0)

    --  end)
    -- publishTimer:start()
end


local function handleMqttError(client, reason) 
    print("failed reason: " .. reason)
    print("reconnecting...")
    tmr.create():alarm(5 * 1000, tmr.ALARM_SINGLE, mqttClient.doMqttConnect)
end


m:lwt("node_mm", "lwt", 0, 0)
m:on("offline", function(client) 
    print ("offline") 
    handleMqttError(client, "offline")
end)


function mqttClient.doMqttConnect()
  m:connect(config.mqtt.serverUrl, config.mqtt.serverPort, function(client) 
        afterMqttConnected(client) 
    end, handleMqttError)
end


function mqttClient.start(x, handelRemoteData)
    mqttClient.doMqttConnect()
    m:on("message", function(client, topic, data) 
        print(topic .. ":" .. data) 
        handelRemoteData(data)
    end)
end

