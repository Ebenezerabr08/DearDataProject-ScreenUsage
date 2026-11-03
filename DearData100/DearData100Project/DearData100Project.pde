// Creating my variables to store the centre position of the canvas
float centreX;
float centreY;
Table data; // The data variable will hold the columns and rows of my dataset

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

  if (data == null) {
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
  }
}

// Here I'm creating a class to represent any survey response
class Response {
  int response_Id;
  String Screen_Time;
  String most_used_app;
  String App_Purpose;
  String emotion_during_usage;

  // Creating a constructor to process each survey response
  Response(int id, String time, String app, String purpose, String emotion) {
    response_Id = id;
    Screen_Time = time;
    most_used_app = app;
    App_Purpose = purpose;
    emotion_during_usage = emotion;
  }
}
