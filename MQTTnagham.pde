// This example sketch connects to the public shiftr.io instance and sends a message on every keystroke.
// After starting the sketch you can find the client here: https://www.shiftr.io/try.
//
// Note: If you're running the sketch via the Android Mode you need to set the INTERNET permission
// in Android > Sketch Permissions.
//
// by Joël Gähwiler
// https://github.com/256dpi/processing-mqtt

import mqtt.*;

MQTTClient client;

class Adapter implements MQTTListener {
  void clientConnected() {
    println("client connected");

    //client.subscribe("/hello");
    client.subscribe("CCDBA730098C_ACK");
    client.subscribe("3C61053DF08C_ACK");
  }

  void messageReceived(String topic, byte[] payload) {
    println("new message: " + topic + " - " + new String(payload));
  }

  void connectionLost() {
    println("connection lost");
  }
}

Adapter adapter;

void setup() {
  size(700, 360);
  adapter = new Adapter();
  client = new MQTTClient(this, adapter);
  client.connect("mqtt://public:public@public.cloud.shiftr.io", "processing");
}

void draw() {
}

void keyPressed() {
  //client.publish("CCDBA730098C_ALM", "world");
  client.publish("CCDBA730098C_ALM", "a5from Nagham's Processing Desktop.");
  client.publish("3C61053DF08C_ALM", "a5from Nagham's Processing Desktop.");
}
