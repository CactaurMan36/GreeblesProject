class EjectButton
{
  PVector position;
  PFont font;
  float radius;
  
  final float fontSize = 25;
  
  EjectButton(float x, float y, float r)
  {
    position = new PVector(x, y);
    radius = r;
    font = createFont("BrowalliaUPC", fontSize);
  }
  
  void display()
  {
    fill(#F50A0A);
    ellipseMode(RADIUS);
    ellipse(position.x, position.y, radius, radius); //draw the button
    textFont(font);
    fill(255);
    text("EJECT", position.x - 25, position.y + 5); //draw the text, if the font size is changed
                                                    //need to change the position values to accomodate
  }
  
  void mousePress() //mousePressed event for Eject button
  {
    if(dist(position.x, position.y, mouseX, mouseY) <= radius)
    { //have the program exit if the button is pressed
      exit();
    }
  }
}
