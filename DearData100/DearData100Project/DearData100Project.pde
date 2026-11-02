//creating my variables to store the centre position of the canvas
float centreX;
float centreY;
Table data; // the data variable will hold the columns and rows of my dataset

void setup () {
  size(1100, 1100); //this creates me a square shaped canvas with equal width and height.
  centreX = width/2;
  centreY = height/2;
  loadData(); //calling the method to read the data
}

void draw () {
  background(10); // this sets my background to a dark colour

  noFill(); //adding transparency to the circle
  stroke(0, 200, 255);
  ellipse(centreX, centreY, 200, 200); // Drawing a circle at the centre of the canvas
  ellipse(centreX, centreY, 350, 350); // Drawing a circle at the centre of the canvas
}

//i created a method to read the data from the CSV
void loadData() {
  data = loadTable("responses.csv", "header");
  if (data == null) {
    println("The CSV file could not be loaded");
  } else {
    println("The dataset has been successfully loaded");
  }
}
