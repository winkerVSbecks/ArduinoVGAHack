import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;

void FESetup()
{ 
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512); 
  textFont(createFont("Helvetica", 16));
  textAlign(CENTER);
}

void stop()
{
  // always close Minim audio classes when you are finished with them
  in.close();
  // always stop Minim before exiting
  minim.stop();
  // this closes the sketch
  super.stop();
}
