EjectButton eButton;
PShape viewPort;

PlayButton playButton;
StopButton stopButton;
import ddf.minim.*;

//audio content
AudioPlayer player;
Minim minim;

float x1;
float x2;
float x3;
float x4;
float y1;
float y2;

void setup()
{
  size(800, 600, P2D);
  eButton = new EjectButton(720f, 50f, 30f);
  x1 = 150;
  x2 = 250;
  x3 = 550;
  x4 = 650;
  
  y1 = 100;
  y2 = 400;
  
  viewPort = createShape();
  viewPort.beginShape();
  viewPort.fill(255);
  viewPort.vertex(x1, 0);
  viewPort.vertex(x1, y1);
  viewPort.vertex(x2, y2);
  viewPort.vertex(x3, y2);
  viewPort.vertex(x4, y1);
  viewPort.vertex(x4, 0);
  viewPort.endShape(CLOSE);
  
  playButton = new PlayButton(600f, 480f);
  stopButton = new StopButton(680f, 480f);
  minim = new Minim(this);
  player = minim.loadFile("GNR.mp3");
  player.play();
}

void draw()
{
  background(0); //clear the stage for the next frame
  eButton.display();
  shape(viewPort);
  
  stroke(0);
  strokeWeight(2.5);
  line(x1 + 50, 0, x1 + 50, y1);
  line(x1, y1, x1 + 50, y1);
  line(x1 + 50, y1, x2 + 25, y2 - 50);
  line(x2 + 25, y2 - 50, x2 + 25, y2);
  line(x2 + 25, y2 - 50, x3 - 25, y2 - 50);
  line(x3 - 25, y2 - 50, x3 - 25, y2);
  line(x3 - 25, y2 - 50, x4 - 50, y1);
  line(x4 - 50, y1, x4, y1);
  line(x4 - 50, y1, x4 - 50, 0);
  
  stroke(25, 203, 250);
  strokeWeight(4);
  line(x1, 0, x1, y1);
  line(0, y1, x1, y1);
  line(x4, 0, x4, y1);
  line(x4, y1, width, y1);
  line(x1, y1, x2, y2);
  line(x4, y1, x3, y2);
  line(0, y2, width, y2);
  line(x2, y2, x2, height);
  line(x3, y2, x3, height);
 
  playButton.display();
  stopButton.display();
  
}

void mousePressed() //helper tool to get the current mouse coordinates
{
  println(mouseX + ", " + mouseY);
  eButton.mousePress();
  playButton.mousePress();
  stopButton.mousePress();
}
