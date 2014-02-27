import ddf.minim.*;
class NextButton
{
  PVector position;
  float radius = 25;
  PImage nextBtn;
  AudioPlayer plr;
  
  NextButton(float posX, float posY)
  {
    position = new PVector(posX,posY);
    nextBtn = loadImage("NextBTN.png");
  }
  
  void display()
  {
    image(nextBtn,position.x,position.y);
  }
  
}
