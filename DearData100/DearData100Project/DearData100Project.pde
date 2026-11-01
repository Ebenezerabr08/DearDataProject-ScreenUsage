//creating my variables to store the centree position of the canvas
float centreX;
float centreY;

void setup () {
  size(1100, 1100); //this creates me a square shaped canvas with equal width and height.
  centreX = width/2;
  centreY = height/2;
}
void draw () {
  background(10); // this sets my background to a dark colour
  
  noFill(); //adding transparency to the circle
  stroke(0, 200, 255); 
  ellipse(centreX, centreY, 200, 200); // Drawing a circle at the centre of the canvas
  ellipse(centreX, centreY, 350, 350); // Drawing a circle at the centre of the canvas
}
