import ddf.minim.*;

EjectButton eButton;
PShape viewPort;
BloomPProcess bloom = new BloomPProcess();
Boolean songPlaying;

PImage testImage;

PlayButton playButton;
StopButton stopButton;

//audio content
//AudioPlayer player;
//Minim minim;

float x1 = 150;
float x2 = 250;
float x3 = 550;
float x4 = 650;

float y1 = 100;
float y2 = 400;

float timer = 0;

void setup()
{
  size(800, 600, P2D);
  
  AudioPlayer player;
  Minim minim;
  
  //testLine
  background(0);

  stroke(25, 203, 250, 150);
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
  saveFrame("cockpit.jpg");
  
  testImage = loadImage( "cockpit.jpg" );
  
  //endtest  
  
  eButton = new EjectButton(720f, 50f, 30f);


  saveFrame("cockpit.jpg");
  //blue lines
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

  minim = new Minim(this);
  player = minim.loadFile("GNR.mp3");
  playButton = new PlayButton(625f, 480f, player);
  stopButton = new StopButton(700f, 480f, player);
  
  
}

void draw()
{

  background(0); //clear the stage for the next frame
  
  //bloom effect
  image( testImage, 0, 0, 800 , 600 );
  bloom.ApplyBloom();
  
  shape(viewPort);

   //buttons
  eButton.display();
  playButton.display();
  stopButton.display();
  
  bloom.ApplyBloom();
  //anything after this wont be bloomed
  
  //window lines
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
 // noCursor();
 // noFill();
 // mouseArc(20, 0, 3*PI/2, -1);
 // mouseArc(30, 0, 3*PI/2, 3);
 // mouseArc(40, 0, 3*PI/2.5, 5);
 // timer++;
  
}

void mousePressed() //helper tool to get the current mouse coordinates
{
  println(mouseX + ", " + mouseY);
  eButton.mousePress();
  playButton.mousePress();
  stopButton.mousePress();
}

void mouseArc(float size, float start, float end, float timerDiv)
{
  arc(mouseX, mouseY, size, size, start + timer/timerDiv, end + timer/timerDiv);
}

