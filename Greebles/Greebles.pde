EjectButton eButton;
PlayButton playButton;
StopButton stopButton;
import ddf.minim.*;

//audio content
AudioPlayer player;
Minim minim;

void setup()
{
  size(800, 600);
  background(255); //we need to figure out a background to have under the ui, we can use
                   //just white for now
  eButton = new EjectButton(700f, 50f, 30f);
  playButton = new PlayButton(600f, 480f);
  stopButton = new StopButton(680f, 480f);
  minim = new Minim(this);
  player = minim.loadFile("GNR.mp3");
  player.play();
}

void draw()
{
  background(255); //clear the stage for the next frame
  eButton.display();
  playButton.display();
  stopButton.display();
  fill(0);
  line(200, 100, 200, 0);
  line(0, 100, 200, 100);
  line(600, 0, 600, 100);
  line(600, 100, 800, 100);
  line(200, 100, 300, 400);
  line(600, 100, 500, 400);
  line(0, 400, 800, 400);
  line(300, 400, 300, 600);
  line(500, 400, 500, 600);
  
}

void mousePressed() //helper tool to get the current mouse coordinates
{
  println(mouseX + ", " + mouseY);
  eButton.mousePress();
  playButton.mousePress();
  stopButton.mousePress();
  
  
  
}
