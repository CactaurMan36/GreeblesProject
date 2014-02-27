import ddf.minim.*;
class Switch
{
  PVector position;
  float radius = 24;
  float xRadius = 24;
  float yRadius = 50;
  PImage switchImg;
  Boolean clicked;
  AudioPlayer plr;
  
  PVector upPos;
  PVector downPos;
  
  Switch(float posX, float posY, AudioPlayer playa)
  {
    position = new PVector(posX, posY);
    upPos = new PVector(posX, posY);
    downPos = new PVector(posX, posY + 28);
    switchImg = loadImage("SwitchUp.png");
    clicked = false;
    plr = playa;
  }
  
  void display()
  {
    image(switchImg,position.x,position.y);
  }
  
  void mousePress() //mousePressed event for button
  {
    if(dist(position.x, position.y, mouseX, mouseY) <= radius)
    { 
        if(clicked == false)
        {
          clicked = true;
          switchImg = loadImage("SwitchDown.png");
          position.set(downPos);
          plr.play();
          plr.rewind();
        }
        else if(clicked == true)
        {
          clicked = false;
          switchImg = loadImage("SwitchUp.png");
          position.set(upPos);
          plr.play();
          plr.rewind();
        }
    }
  }
  
}
