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
  
  Switch(float posX, float posY, AudioPlayer playa)
  {
    position = new PVector(posX, posY);
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
          plr.play();
          plr.rewind();
        }
        else if(clicked == true)
        {
          clicked = false;
          switchImg = loadImage("SwitchUp.png");
          plr.play();
          plr.rewind();
        }
    }
  }
  
}
