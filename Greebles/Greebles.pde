EjectButton eButton;

void setup()
{
  size(800, 600);
  background(255); //we need to figure out a background to have under the ui, we can use
                   //just white for now
  eButton = new EjectButton(400f, 100f, 30f);
}

void draw()
{
  background(255); //clear the stage for the next frame
  eButton.display();
}

void mousePressed() //helper tool to get the current mouse coordinates
{
  println(mouseX + ", " + mouseY);
  eButton.mousePress();
}
