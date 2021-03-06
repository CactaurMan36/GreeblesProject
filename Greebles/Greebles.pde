import ddf.minim.*;

EjectButton eButton;
PShape viewPort;
BloomPProcess bloom = new BloomPProcess();
boolean songPlaying = false;

PImage backgroundUI;
PFont uiFont;

Boolean isFirstSong = true;

PlayButton playButton;
StopButton stopButton;
NextButton nextButton;
Switch switch1;
Switch switch2;
Switch switch3;
Switch switch4;


MusicBar[] mBars;
int numBars = 5;

float x1 = 150;
float x2 = 250;
float x3 = 550;
float x4 = 650;

float y1 = 100;
float y2 = 400;

float timer = 0;

float savedTime = 0;
float totalTime = 1000;

int mgAmmo = 800;
int miAmmo = 100;
int lAmmo = 200;
int stringID = 0;

AudioPlayer player;
AudioPlayer player2;
Minim minim;

void setup()
{
  size(800, 600, P2D);
  
  //testLine
  background(0);
  
  backgroundUI = loadImage( "background.jpg" );
  uiFont = createFont("Gimme Danger.ttf", 18);
  //Gimme Danger font by Imagex Fonts
  
  eButton = new EjectButton(720f, 50f, 30f);
  

  minim = new Minim(this);
  player = minim.loadFile("GNR.mp3");
  player2 = minim.loadFile("switchNoise.mp3");
  playButton = new PlayButton(585f, 480f, player);
  stopButton = new StopButton(660f, 480f, player);
  nextButton = new NextButton(735f, 480f);
  
  switch1 = new Switch(10f, 10f, player2);
  switch2 = new Switch(40f, 10f, player2);
  switch3 = new Switch(70f, 10f, player2);
  switch4 = new Switch(100f, 10f, player2);
  
  mBars = new MusicBar[5];
  for(int i = 0; i < numBars; i++)
  {
    mBars[i] = new MusicBar(580 + (40 * i), 530);
  }
  
  savedTime = millis();
}

void draw()
{

  background(0); //clear the stage for the next frame
  
  image( backgroundUI, 0, 0, 800 , 600 );
  
  //buttons-----------------------------------
  eButton.display();
  playButton.display();
  stopButton.display();
  nextButton.display();
  switch1.display();
  switch2.display();
  switch3.display();
  switch4.display();
  //------------------------------------------
  
  //middle console text-----------------------
  textFont(uiFont);
  float passedTime = millis() - savedTime;
  if(passedTime >= totalTime)
  {
    fill(200,30,30);
    text("ENEMY DETECTED", 270, 440);
    
    //BRINKING RIGHTS
    if(passedTime >= 2000)
    {
      savedTime = millis();
    }
    noFill();
  }
  else
  {
   text("ENEMY DETECTED", 270, 440);
  }
  
  noFill();
  text("TARGET - UZIEL", 270, 490);
  text("THREAT", 270, 540);
  text("LEVEL  -", 282, 570);
  text("LOW", 425, 565);
  //---------------------------------------------
  
  //left side weapons display--------------------
  textFont(uiFont, 14); //still need fontsize
  String machineGun = "MACHINE GUN";
  String missiles = "ROCKET LAUNCHER";
  String lasers = "LASER RIFLE";
  String[] ammoTypes = {machineGun, lasers, missiles}; 
  for(int i = 0; i < ammoTypes.length; i++)
  {
    if(stringID == i)
    {
      fill(247, 239, 77, 255);
      if(i == 0)
      {
        text(ammoTypes[i], 5, 150); 
        text(Integer.toString(mgAmmo), 60, 180);
      }
      else if(i == 1)
      {
        text(ammoTypes[i], 25, 245);
        text(Integer.toString(lAmmo), 70, 275);
      }
      else
      {
        text(ammoTypes[i], 5, 340);
        text(Integer.toString(miAmmo), 85, 370);
      }
    }
    else
    {
      fill(255, 255, 255, 120);
      if(i == 0)
      {
        text(ammoTypes[i], 5, 150); 
        text(Integer.toString(mgAmmo), 60, 180);
      }
      else if(i == 1)
      {
        text(ammoTypes[i], 25, 245);
        text(Integer.toString(lAmmo), 70, 275);
      }
      else
      {
        text(ammoTypes[i], 5, 340);
        text(Integer.toString(miAmmo), 85, 370);
      }
    }
  }
  //---------------------------------------------
  
  //music bars-----------------------------------
  //make bars move only when song is playing-----
  if(player.isPlaying() || player2.isPlaying())
  {
    for(MusicBar m: mBars)
    {
      m.move();
      m.display();
    }
  }
  //---------------------------------------------
  
  //mouseArc-------------------------------------
  stroke(25, 203, 250);
  //strokeWeight(2);
  noCursor();
  fill(25, 203, 250);
  mouseArc(5, 0, TWO_PI, 100);
  noFill();
  mouseArc(10, 0, 3*PI/2, -10);
  mouseArc(20, 0, 3*PI/2, 20);
  mouseArc(30, 0, 3*PI/2.5, -30);
  timer++;
  //---------------------------------------------
  
}

void nextMousePress() //mousePressed event for next button
  {
    if(dist(nextButton.position.x, nextButton.position.y, mouseX, mouseY) <= nextButton.radius)
    { 
      if(isFirstSong == true)
      {
        player.pause();
        player = minim.loadFile("HBFS.mp3");
        player.rewind();
        player.play();
        isFirstSong = false;
      }
      else if(isFirstSong == false)
      {
        player.pause();
        player = minim.loadFile("GNR.mp3");
        player.rewind();
        player.play();
        isFirstSong = true;
      }
      
    }
  }

void mousePressed() 
{
  println(mouseX + ", " + mouseY); //helper tool to get the current mouse coordinates
  eButton.mousePress();
  playButton.mousePress();
  stopButton.mousePress();
  switch1.mousePress();
  switch2.mousePress();
  switch3.mousePress();
  switch4.mousePress();
  nextMousePress();
}

void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP)
    {
      stringID--;
      if(stringID < 0)
        stringID = 0;
    }
    else if(keyCode == DOWN)
    {
      stringID++;
      if(stringID > 2)
        stringID = 2;
    }
  }
  else
  {
    if(key == ' ')
    {
      if(stringID == 0)
      {
        if(mgAmmo > 0)
          mgAmmo--;
      }
      else if(stringID == 1)
      {
        if(lAmmo > 0)
          lAmmo--;
      }
      else
      {
        if(miAmmo > 0)
          miAmmo--;
      }
    }
    
    else if(key == 'r')
    {
      if(stringID == 0)
      {
        mgAmmo = 800;
      }
      else if(stringID == 1)
      {
        lAmmo = 200;
      }
      else
      {
        miAmmo = 100;
      }
    }
  }
}

void mouseArc(float size, float start, float end, float timerDiv)
{
  arc(mouseX, mouseY, size, size, start + timer/timerDiv, end + timer/timerDiv);
}

