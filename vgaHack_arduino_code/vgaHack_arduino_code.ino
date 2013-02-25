/* 
 Hacking VGA lines with Arduino
 
 Make sure the arduino is connected to your computer. It will monitor the serial port
 for signals which then gets translated to the RGB line data for the VGA connnection.
 The pot meters control the colour to some extent.
 
 See more info:
 http://little-scale.blogspot.nl/2008/02/hacking-vga-lines-with-arduino.html
 
 by Sebastian Tomczak
 
 sample video: https://vimeo.com/16249462
 */

byte data1 = 0;
byte data2 = 0;
int dT = 0;

void setup() {
  Serial.begin(57600);
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, OUTPUT);
}

void loop() {
  if(Serial.available() > 1) {
    data1 = Serial.read();
    data2 = Serial.read();
  }

  dT = data2 << 5;
  PORTD = data1 << 2;
  delayMicroseconds(dT + 1);
  PORTD = (255 - data1) << 2;
  delayMicroseconds(dT + 1);
}



