class MusicBar
{
  PVector position;
  int range = 5;
  int initialY;
  int maxHeight = 75;
  
  color color1 = color(250, 255, 3, 99);
  color color2 = color(245, 22, 30, 99);
  
  MusicBar(float x, float y)
  {
    position = new PVector(x, y);
    initialY = (int)y;
  }
  
  void display()
  {
    //rect(position.x, position.y, 30, initialY + maxHeight);
    gradient(position.x, position.y, 30, height - position.y, color1, color2); 
  }
  
  void move()
  {
    float incrementer = random(-range, range);
    float constrainedInt = constrain(position.y + incrementer, initialY, initialY + maxHeight); 
    position.set(position.x, constrainedInt);
  }
  
  void gradient(float x, float y, float w, float h, color c1, color c2)
  {
    for (int i = (int)y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
}
