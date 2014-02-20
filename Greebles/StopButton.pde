class StopButton
{
  PVector position;
  float radius = 25;
  PImage stopBtn;
  
  StopButton(float posX, float posY)
  {
    position = new PVector(posX,posY);
    stopBtn = loadImage("StopBTN.png");
    
  }
  
  void display()
  {
    image(stopBtn,position.x,position.y);
  }
  
  void mousePress() //mousePressed event for Eject button
  {
    if(dist(position.x, position.y, mouseX, mouseY) <= radius)
    { 
      
    }
  }
  
}
