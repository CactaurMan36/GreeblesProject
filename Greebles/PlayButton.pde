import ddf.minim.*;
class PlayButton
{
  PVector position;
  float radius = 25;
  PImage playBtn;
  Boolean sngPlaying;
  AudioPlayer plr;
  
  PlayButton(float posX, float posY, AudioPlayer p)
  {
    position = new PVector(posX,posY);
    playBtn = loadImage("PlayBTN.png");
    plr = p;
  }
  
  void display()
  {
    image(playBtn,position.x,position.y);
  }
  
  void mousePress() //mousePressed event for Eject button
  {
    if(dist(position.x, position.y, mouseX, mouseY) <= radius)
    { 
        plr.play();
        
    }
  }
  
}
