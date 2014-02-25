import ddf.minim.*;
class StopButton
{
  PVector position;
  float radius = 25;
  PImage stopBtn;
  AudioPlayer plr;
  
  StopButton(float posX, float posY, AudioPlayer p)
  {
    position = new PVector(posX,posY);
    stopBtn = loadImage("StopBTN.png");
    plr = p;
  }
  
  void display()
  {
    image(stopBtn,position.x,position.y);
  }
  
  void mousePress() //mousePressed event for Eject button
  {
    if(dist(position.x, position.y, mouseX, mouseY) <= radius)
    { 
        plr.pause();
    }
  }
  
}
