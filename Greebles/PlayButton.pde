class PlayButton
{
  PVector position;
  float radius = 25;
  PImage playBtn;
  Boolean playSong;
  
  PlayButton(float posX, float posY)
  {
    position = new PVector(posX,posY);
    playBtn = loadImage("PlayBTN.png");
    
  }
  
  void display()
  {
    image(playBtn,position.x,position.y);
  }
  
  void mousePress() //mousePressed event for Eject button
  {
    if(dist(position.x, position.y, mouseX, mouseY) <= radius)
    { 
      
    }
  }
  
}
