/* 
 Hacking VGA lines with Arduino
 
 This is the audio analysis part. Basically it's the sample beat listner code from
 the minim library. It simply looks for the highest Frequency Energy value in one buffer,
 maps it to the appropriate scale (0, 255) and writes it to serial.
 
 Make sure the arduino is connected to your computer and that you have selected the correct 
 serial port. List all the available serial ports using if you are unsure:
 println(Serial.list());
 
 If you are doing live audio/visuals then you probably want to set (in FESetup()): 
 beat.setSensitivity(0); 

 works in Processing 1.5
 Have not tested this in Processing 2.0 there might be some issues with minim and/or serial

 sample video: https://vimeo.com/16249462
*/

import processing.serial.*;

Serial myPort;       
int maxVel = 0;

void setup()
{
  size(300, 300);
  FESetup();
  myPort = new Serial(this, Serial.list()[1], 57600);
  song.play();
  rectMode(CENTER);
}

void draw()
{
  background(0);
  stroke(255);

  for(int i = 0; i < song.left.size()-1; i++)
  {
    int currVel = 0;
    float measuredVel = 0;
    measuredVel = song.left.get(i);
    currVel = 127 - int(map(measuredVel, -1, 1, 0, 255));
    if(currVel >= maxVel){
      maxVel = currVel;    
    }
  }
  
  text(maxVel, width/2, height/2);
  myPort.write(maxVel);
  maxVel = 0;
}

