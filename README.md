# OpenWest2018 Electronic Badge

![BadgePic](https://github.com/compukidmike/OpenWest2018/blob/master/BadgeFinished.jpg)

## This year's badge is dedicated to our dear friend d3c4f. May his memory live on through many more awesome badges. 

The 2018 badge features WiFi connectivity, and all the badges are controlled by an MQTT server. The main controller is a WeMos D1 Mini, which uses the ESP8266 WiFi module.

**A note on battery life:** WiFi uses a lot of power. So do LEDs. The badges probably won't last more than a day on batteries. Take them out when you're not at the conference to avoid unnecessary battery drain. **Also, don't connect a USB cable while the batteries are in the badge. Bad things could happen.**

One of the fun things about this badge is that they're all controlled by this central server. There's no authentication on MQTT publications, so anyone can change what all the badges are doing. There are many programs to interact with MQTT servers. MQTTLens is a free chrome app that's very easy to use. If you want to learn more about MQTT go here https://www.hivemq.com/blog/mqtt-essentials-part-1-introducing-mqtt

We're using mosquitto (https://mosquitto.org/) for our local MQTT server. This server is only available at the conference. After the con is over, you'll have to connect the badge to your own server or an online service like adafruit.io. There are instructions below on how to do that.

The local MQTT server IP is 10.155.0.214, port 1883

The Feeds are setup as follows:
- Feed names: color1, color2, effect, effectspeed
- All feeds are prefixed by `feeds/`
- Colors are in Hex format (FFFFFF)
- Effectspeed is 0-255
- Effect is 0-6 (Off, On, Blink, Pulse, Alternate1, Alternate2, Rainbow)
- Must set retain flag on messages

The retain flag is important. It tells the server to keep the last message, and give it to any new client that subscribes to a feed. That means your badge won't have to wait until a new message is sent out to start displaying the proper colors, etc.

----------

## To get the Arduino IDE set up, you'll need to do the following:
(The Arduino IDE can be downloaded from https://www.arduino.cc/)
- Add the ESP8266 to the boards menu
  - From the Arduino IDE, click on File -> Preferences
  - Add this URL to the "Additional Boards Manager URLs" http://arduino.esp8266.com/stable/package_esp8266com_index.json
  - Click OK
  - Click on Tools > Board > Board Manager
  - Type ESP8266 in the search box
  - Find ESP8266 in the list and click Install
- Add the required libraries
  - Click Sketch > Include Library > Manage Libraries...
  - Search for and install the following libraries:
    - Adafruit IO Arduino
    - Adafruit MQTT Library
    - ArduinoHTTPClient
    - FastLED
    - WiFi



## To connect the badge to your own WiFi network:
- Edit the following lines in the code:
  ```
  #define WLAN_SSID       "OPENWEST-GUEST"
  #define WLAN_PASS       "Openwest2018!"
  ```

## To connect the badge to a different MQTT server:
- Edit the following lines in the code:
  ```
  #define AIO_SERVER      "10.155.0.214"         // IP or URL for MQTT server
  #define AIO_SERVERPORT  1883                   // use 8883 for SSL
  #define AIO_USERNAME    "test"                 // Adafruit.io username
  #define AIO_KEY         "1234567890"           // Adafruit.io key
  ```
- To connect to adafruit.io, you'll need to create an account and then put your username and AIO key here. There are also more steps below for adafruit.io

## Adafruit.io Workaround
If you attended my talk about the badge, I talked about how adafruit.io is an MQTT server that doesn't fit the spec. One of the things I said was that they retain messages by default. Well, they changed that, but still don't support the retain flag, so there's a workaround. Please keep in mind that they made this change on May 9, 2018. I've been working with the badge code since long before that. They've updated their libraries to handle this, but I haven't had a chance to mess with it. If you get it working with the new Adafruit IO library, please submit a pull request.
Here's the blog post that talks about the change: https://io.adafruit.com/blog/notebook/2018/05/09/new-ruby-client-and-chart-updates/

### So, with that said, here's the workaround:
- All feed names are prefixed by your username, so they look like this: `<username>/feeds/<feed_name>`
- You'll need to set up a publish feed for each of your feed subscriptions with `/get` at the end (I know, it's ridiculous).
  - Example: ```Adafruit_MQTT_Publish color1get = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/color1/get");```
  - Note that the name must be different from the feed subscription (color1get vs color1)
- Then, near the bottom of the code after this line: ```Serial.println("MQTT Connected!");```
  - Add a publish for each feed:
    ```
    color1get.publish('\0');
    color2get.publish('\0');
    effectget.publish('\0');
    effectspeedget.publish('\0');
    delay(1000); //delay for receiving the packets
    ```
  - The delay is necessary to give time to get the response from the server and not drop packets
  
I know this is an ugly workaround. I'm sorry. On the bright side, it does show how to setup and publish data back to the server.

----------

If I missed anything, or you have something to add to this readme, please submit a pull request.
