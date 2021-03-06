import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;

void FESetup()
{ 
  minim = new Minim(this);
  song = minim.loadFile("groove.mp3", 2048);
  song.play();  
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  song.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}
