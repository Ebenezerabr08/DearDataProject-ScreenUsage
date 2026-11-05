
// Creating my variables to store the centre position of the canvas
float centreX;
float centreY;
Table data; // The data variable will hold the columns and rows of my dataset
float x; //float x and y will store the coordinates of each participants circle
float y;

//ive created an array to store all the objects in class 
ArrayList<Response> responses = new ArrayList<Response>();

void setup () {
  size(1100, 1100); // This creates a square-shaped canvas with equal width and height.
  centreX = width/2;
  centreY = height/2;
  loadData(); // Calling the method to read the data
}

void draw () {
  background(10); // This sets my background to a dark colour

  noFill(); // Adding transparency to the circle
  stroke(0, 200, 255);
  ellipse(centreX, centreY, 200, 200); // Drawing a circle at the centre of the canvas
  ellipse(centreX, centreY, 350, 350); // Drawing a circle at the centre of the canvas
}

// I created a method to read the data from the CSV
void loadData() {
  data = loadTable("responses.csv", "header");

  if (data == null) { //null indicates nothing as in no data in the database
    println("The CSV file could not be loaded");
  } else {
    println("The dataset has been successfully loaded");

    for(int i = 0; i< data.getRowCount(); i++) { //this loop will repeat once for every row in my CSV until every row has been processed.
      int id = data.getInt(i, "response_id"); //extracting of data as seperate attributes
      String time = data.getString(i, "screen_time_range");
      String app = data.getString(i, "most_used_app");
      String purpose = data.getString(i, "most_used_app_purpose");
      String emotion = data.getString(i, "emotion_during_usage");
      Response response = new Response(id, time, app, purpose, emotion);
      responses.add(response);
    }
    //this print statement will give me an indication of how many itemshave been read from the database and will be displayed in my console 
    println("Total responses stored: " + responses.size());
  }
}

// This method relate each response in the data to a vale
int getRingIndex(String screenTime) {

  if (screenTime.equals("Less than 1 hour")) {
    return 0;
  } else if (screenTime.equals("1-2 hours")) {
    return 1;
  } else if (screenTime.equals("2-3 hours")) {
    return 2;
  } else if (screenTime.equals("3-4 hours")) {
    return 3;
  } else if (screenTime.equals("4-5 hours")) {
    return 4;
  } else if (screenTime.equals("5-6 hours")) {
    return 5;
  } else if (screenTime.equals("6-7 hours")) {
    return 6;
  } else if (screenTime.equals("7+ hours")) {
    return 7;
  }

  return -1; //if the screen time category does not match any of the options then -1 is returned as the index
}

// This method calculates the radius of a ring based on its index
float getRingRadius(int ringIndex) {

  if (ringIndex == 0) {
    return 100;
  } else if (ringIndex == 1) {
    return 150;
  } else if (ringIndex == 2) {
    return 200;
  } else if (ringIndex == 3) {
    return 250;
  } else if (ringIndex == 4) {
    return 300;
  } else if (ringIndex == 5) {
    return 350;
  } else if (ringIndex == 6) {
    return 400;
  } else if (ringIndex == 7) {
    return 450;
  }

  return -1; //if the ring index is not valid -1 is returned
}

// Here I'm creating a class to represent any survey response
class Response {
  int response_Id; //declaring all the attributes of my class and their data type
  String Screen_Time;
  String most_used_app;
  String App_Purpose;
  String emotion_during_usage;

  // Creating a constructor to process each survey response, this will transfer a value from the constructor into the objects attributes
  Response(int id, String time, String app, String purpose, String emotion) {
    response_Id = id;
    Screen_Time = time; 
    most_used_app = app;
    App_Purpose = purpose;
    emotion_during_usage = emotion;
  }
}
