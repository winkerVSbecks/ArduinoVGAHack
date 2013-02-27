# Hacking VGA lines with Arduino
Original implementation, tutorial and arduino code by Sebastian Tomczak [little scale](http://little-scale.blogspot.nl/2008/02/hacking-vga-lines-with-arduino.html)

See the above link for the arduino circuit, pin mapping and a proper explanation of what is actually happening.

I basically created a very simple audio reactive version of this and use processing instead of Max/Msp. The audio analysis part is the sample beat listner code from the minim library. It looks for the highest Frequency Energy value in one buffer, maps it to the appropriate scale (0, 255) and writes it to serial.

sample video: [https://vimeo.com/16249462](https://vimeo.com/16249462) (with random data) & sample video: [https://vimeo.com/18633193](https://vimeo.com/18633193) (audio reactive)


## To Get It Working
- Build the circuit
- Make sure the arduino is connected to your computer. 
- Upload ```vgaHack_arduino_code.ino``` to the arduino
- Select the correct serial port in the Processing code: ```vgaHackSoundSignals.pde```. If you are unsure, use ```println(Serial.list());``` to list all the available serial ports.
- Make sure you have selected the same baud rate in both arduino and processing
- Run the processing sketch
- If want to get live audio in and make visuals react to that, use  ```vgaHackLineInSignals.pde``` instead

 
*Works in Processing 1.5*. *I have not tested this in Processing 2.0 there might be some issues with minim and/or serial.*
