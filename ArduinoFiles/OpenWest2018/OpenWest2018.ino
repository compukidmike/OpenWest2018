/***************************************************
 * OpenWest2018 Badge Code
 * by compukidmike
 * 
 * This code relies on the following libraries:
 * - Adafruit MQTT
 * - FastLED
 * - Arduino Wifi
 * 
 * This code borrows code snippets from Adafruit and http://forum.arduino.cc/index.php?topic=145385.0
 * There are probably others that I forgot. I don't claim any of this code as my own.
 ***************************************************/


#include <ESP8266WiFi.h>
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"

#define FASTLED_ESP8266_RAW_PIN_ORDER
#include "FastLED.h"

#define PIXEL_PIN     2
#define PIXEL_COUNT   12
#define PIXEL_TYPE    NEO_GRB + NEO_KHZ800

/************************* WiFi Access Point *********************************/
// Change these to your personal wifi

#define WLAN_SSID       "OPENWEST-GUEST"
#define WLAN_PASS       "Openwest2018!"

/************************* Adafruit.io Setup *********************************/
// you need to create an account at adafruit.io to use their server

#define AIO_SERVER      "10.155.0.214"         // IP or URL for MQTT server
#define AIO_SERVERPORT  1883                   // use 8883 for SSL
#define AIO_USERNAME    "test"                 // Adafruit.io username
#define AIO_KEY         "1234567890"           // Adafruit.io key

/************ Global State (you don't need to change this!) ******************/

// Create an ESP8266 WiFiClient class to connect to the MQTT server.
WiFiClient client;
// or... use WiFiFlientSecure for SSL
//WiFiClientSecure client;

// Setup the MQTT client class by passing in the WiFi client and MQTT server and login details.
Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);

/****************************** Feeds ***************************************/

// Setup a feed called 'photocell' for publishing.
// Notice MQTT paths for AIO follow the form: <username>/feeds/<feedname>
//Adafruit_MQTT_Publish photocell = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "/feeds/photocell");

// Setup a feeds for subscribing to changes. Set QoS to 1 to make sure you get messages at least once.
// You can add your own feeds here. You need to add a check to the main loop below to handle your feed data.
Adafruit_MQTT_Subscribe color1 = Adafruit_MQTT_Subscribe(&mqtt, "feeds/color1",1);
Adafruit_MQTT_Subscribe color2 = Adafruit_MQTT_Subscribe(&mqtt, "feeds/color2",1);
Adafruit_MQTT_Subscribe effect = Adafruit_MQTT_Subscribe(&mqtt, "feeds/effect",1);
Adafruit_MQTT_Subscribe effectspeed = Adafruit_MQTT_Subscribe(&mqtt, "feeds/effectspeed",1);

/*************************** Sketch Code ************************************/

CRGB leds[PIXEL_COUNT]; //variable for storing led color data

byte Effect = 0; //Current Effect
byte Speed = 0; //Effect Speed
int counter1 = 0;
int counter2 = 0;
long Color1 = 0;
long Color2 = 0;
long nextPing = 0; //time until next keepalive ping

// Bug workaround for Arduino 1.6.6, it seems to need a function declaration
// for some reason (only affects ESP8266, likely an arduino-builder bug).
void MQTT_connect();

template <typename T>
void updateLEDs(CRGB (&led)[PIXEL_COUNT], T first_color, T second_color) {

  for (int i= 0; i<PIXEL_COUNT; i ++) {
    if (i % 2 != 0 )
      led[i] = first_color;
    else
      led[i] = second_color;
  }

}
void setup() {
  FastLED.addLeds<NEOPIXEL, PIXEL_PIN>(leds, PIXEL_COUNT);
  leds[0] = 0;
  leds[1] = 0;
  FastLED.show();
  
  Serial.begin(115200);
  
  byte mac[6];
  WiFi.macAddress(mac);
  Serial.print("MAC: "); //Print MAC address
  Serial.print(mac[0],HEX);
  Serial.print(":");
  Serial.print(mac[1],HEX);
  Serial.print(":");
  Serial.print(mac[2],HEX);
  Serial.print(":");
  Serial.print(mac[3],HEX);
  Serial.print(":");
  Serial.print(mac[4],HEX);
  Serial.print(":");
  Serial.println(mac[5],HEX);
  
  delay(1); //10

  Serial.println(F("OpenWest 2018 Badge"));

  // Connect to WiFi access point.
  Serial.println(); Serial.println();
  Serial.print("Connecting to ");
  Serial.println(WLAN_SSID);
  
  WiFi.mode(WIFI_STA);
  WiFi.begin(WLAN_SSID, WLAN_PASS);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println();

  Serial.println("WiFi connected");
  Serial.println("IP address: "); Serial.println(WiFi.localIP());

  // Setup MQTT subscription for onoff feed.
  mqtt.subscribe(&color1);
  mqtt.subscribe(&color2);
  mqtt.subscribe(&effect);
  mqtt.subscribe(&effectspeed);
  //}
}

uint32_t x=0;

void loop() {
  // Ensure the connection to the MQTT server is alive (this will make the first
  // connection and automatically reconnect when disconnected).  See the MQTT_connect
  // function definition further below.
  MQTT_connect();

  // this is our 'wait for incoming subscription packets' busy subloop
  // try to spend your time here

  Adafruit_MQTT_Subscribe *subscription;
  while ((subscription = mqtt.readSubscription(10))) {
    if (subscription == &color1) {
      Serial.print(F("Got color1: "));
      Serial.println((char *)color1.lastread);
      Color1 = x2i((char *)color1.lastread);
      leds[0] = Color1;
      //FastLED.show();
    }
    if (subscription == &color2) {
      Serial.print(F("Got color2: "));
      Serial.println((char *)color2.lastread);
      Color2 = x2i((char *)color2.lastread);
      leds[1] = Color2;
      //FastLED.show();
    }
    if (subscription == &effect) {
      Serial.print(F("Got effect: "));
      Serial.println((char *)effect.lastread);
      Effect = atoi((char *)effect.lastread);
      counter1 = 0;
      counter2 = 0;
    }
    if (subscription == &effectspeed) {
      Serial.print(F("Got speed: "));
      Serial.println((char *)effectspeed.lastread);
      Speed = atoi((char *)effectspeed.lastread);
    }
  }

  //Update LEDs based on Effect and Speed - Runs every ~10ms
  //Effect 0 = Off
  //Effect 1 = On
  //Effect 2 = Blink
  //Effect 3 = Pulse
  //Effect 4 = Alternate 1
  //Effect 5 = Alternate 2
  //Effect 6 = Rainbow

  switch (Effect){
      case 0: //off
        updateLEDs(leds, 0, 0);
        break;
      case 1: //on
        updateLEDs(leds, Color1, Color2);
        break;
      case 2: //blink
        counter1 += Speed;
        if(counter1 > 255){
          counter1 = 0;
          if(counter2 == 0){
            updateLEDs(leds, 0 ,0);
            counter2 = 1;
          }else{
            updateLEDs(leds, Color1, Color2);
            counter2 = 0;
          }
        }
        break;
      case 3: //Pulse
        if(counter2 == 0){ //count up
          counter1 += Speed;
          if(counter1 > 255){
            counter2 = 1;
            counter1 = 255;
          }
        }else{
          counter1 -= Speed;
          if(counter1 < 0){ //count down
            counter2 = 0;
            counter1 = 0;
          }
        }
        updateLEDs(leds, (Color1 % counter1), (Color2 % counter1));
        //leds[0] = Color1;
        //leds[0] %= counter1;
        //leds[1] = Color2;
        //leds[1] %= counter1;
        break;
      case 4: //Alternate Colors 1
        counter1 += Speed;
        if(counter1 > 255){
          counter1 = 0;
          if(counter2 == 0){
            counter2 = 1;
            updateLEDs(leds, Color1, Color2);
          }else{
            counter2 = 0;
            updateLEDs(leds, Color2, Color1);
          }
        }
        break;
      case 5: //Alternate Colors 2
        counter1 += Speed;
        if(counter1 > 255){
          counter1 = 0;
          if(counter2 == 0){
            counter2 = 1;
            updateLEDs(leds, Color1, Color1);
          }else{
            counter2 = 0;
            updateLEDs(leds, Color2, Color2);
          }
        }
        break;
      case 6: //Rainbow
        counter1 += Speed;
        if(counter1>255) counter1 = 0;
        updateLEDs(leds, CHSV(counter1,187,128), CHSV(counter1,187,128));
        break;
      default:
        updateLEDs(leds, Color1, Color2);
    }
  
  FastLED.show();

/*
  // This is sample code for publishing to the MQTT server
  Serial.print(F("\nSending photocell val "));
  Serial.print(x);
  Serial.print("...");
  if (! photocell.publish(x++)) {
    Serial.println(F("Failed"));
  } else {
    Serial.println(F("OK!"));
  }
*/
  // ping the server to keep the mqtt connection alive
  // NOT required if you are publishing once every KEEPALIVE seconds
  if(millis() > nextPing){
    nextPing = millis() + 60000; //1 minute
    if(! mqtt.ping()) {
      mqtt.disconnect();
    }
  }
  
  delay(2);
}

// Function to connect and reconnect as necessary to the MQTT server.
// Should be called in the loop function and it will take care if connecting.
void MQTT_connect() {
  int8_t ret;

  // Stop if already connected.
  if (mqtt.connected()) {
    return;
  }

  Serial.print("Connecting to MQTT... ");

  uint8_t retries = 3;
  while ((ret = mqtt.connect()) != 0) { // connect will return 0 for connected
       Serial.println(mqtt.connectErrorString(ret));
       Serial.println("Retrying MQTT connection in 5 seconds...");
       mqtt.disconnect();
       delay(5000);  // wait 5 seconds
       retries--;
       if (retries == 0) {
         // basically die and wait for WDT to reset me
         while (1);
       }
  }
  Serial.println("MQTT Connected!");
}

int x2i(char *s) //convert hex string to integer
{
 int x = 0;
 for(;;) {
   char c = *s;
   if (c >= '0' && c <= '9') {
      x *= 16;
      x += c - '0'; 
   }
   else if (c >= 'A' && c <= 'F') {
      x *= 16;
      x += (c - 'A') + 10; 
   }
   else if (c >= 'a' && c <= 'f') {
      x *= 16;
      x += (c - 'a') + 10;
}
   else break;
   s++;
 }
 return x;
}
