import guru.ttslib.*;

import interfascia.*;

GUIController c;
TTS tts;

IFButton b1, b2, b3, b4, b5, b6, b7, b8, b9, b10;
IFButton current, destination, close, open, alert;
IFButton[] buttons = {b1, b2, b3, b4, b5, b6, b7, b8, b9, b10};
IFLookAndFeel none, red, green, orange, selected;
String[] buttonLabel = {"1","2","3","4","5","6","7","8","9","10"};

int alerted = 0;
int currentFloor = 10;
int destinationFloor;
int changeFloor = 0;
void setup() {
  size(120, 420);
  background(200);
  
  c = new GUIController (this);
  
  tts = new TTS();

  int row = 30;
  int column;
  int number = 10;
  String destinationF = "10";
   
  none = new  IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  none.baseColor = color(161, 161, 159);
  none.highlightColor = color(118, 191, 111);
  
  red = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  red.baseColor = color(255, 117, 117);
  red.highlightColor = color(255, 0, 0);
  
  green = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  green.baseColor = color(97, 232, 56);
  green.highlightColor = color(97, 232, 56);
  
  orange = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);
  orange.baseColor = color(252, 148, 3);
  orange.highlightColor = color(252, 148, 3);
   
   
  fill(50);
  text("Current Floor", 25,20);
  current = new IFButton(String.valueOf(currentFloor), 45, 30, 30, 30);
  current.setLookAndFeel(none);
  c.add(current);
  
  
  fill(50);
  text("Destintation Floor", 15,80);  
  destination = new IFButton(destinationF, 45, 90, 30, 30);
  destination.setLookAndFeel(none);
  c.add(destination);

  
  for (int ix = 5; ix < 15; ix = ix + 1){
    row = ix*30; 
    for (int ixx = 1; ixx < 3; ixx = ixx + 1){
      
      if (number == 0){
        ix = 15;
      } else {
        column = ixx*30;
        
        buttons[number-1] = new IFButton(String.valueOf(number) , column, row, 30, 30);
        buttons[number-1].addActionListener(this);
        c.add(buttons[number-1]);
        buttons[number-1].setLookAndFeel(none);
        number -= 1;
      }
    }
  }
  
  fill(50);
  open = new IFButton("Open", 30,330,30,30);
  open.addActionListener(this);
  c.add(open);
  open.setLookAndFeel(red);
  
  fill(50);
  close = new IFButton("Close", 60,330,31,30);
  close.addActionListener(this);
  c.add(close);
  close.setLookAndFeel(red);
  
  fill(50);
  alert = new IFButton("Alert", 30,360,30,30);
  alert.addActionListener(this);
  c.add(alert);
  alert.setLookAndFeel(red);
}

void draw() {

  changeFloorRoutine(currentFloor, Integer.parseInt(destination.getLabel()));
  
  if (changeFloor == 1)
    if(currentFloor == Integer.parseInt(destination.getLabel())){
      current.setLookAndFeel(green);
      destination.setLookAndFeel(green);
      changeFloor = 0;
      tts.speak("Arriving at floor "+ currentFloor);
    } else {
      current.setLookAndFeel(orange);
      destination.setLookAndFeel(orange);
    }
  
}

void actionPerformed (GUIEvent e) {
  changeFloor = 1;
  if (e.getSource() == buttons[0]) {
    destination.setLabel("1");
    tts.speak("1 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == buttons[1]) {
    destination.setLabel("2");
    tts.speak("2 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == buttons[2]) {
    destination.setLabel("3");
    tts.speak("3 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == buttons[3]) {
    destination.setLabel("4");
    tts.speak("4 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == buttons[4]) {
    destination.setLabel("5");
    tts.speak("5 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == buttons[5]) {
    destination.setLabel("6");
    tts.speak("6 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == buttons[6]) {
    destination.setLabel("7");
    tts.speak("7 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == buttons[7]) {
    destination.setLabel("8");
    tts.speak("8 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == buttons[8]) {
    destination.setLabel("9");
    tts.speak("9 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == buttons[9]) {
    destination.setLabel("10");
    tts.speak("10 selected");
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  } else if (e.getSource() == open){
    tts.speak("Doors opening");
    changeFloor = 0;
  } else if (e.getSource() == close){
    tts.speak("Doors closing");
    changeFloor = 0;
  } else if (e.getSource() == alert){
    tts.speak("Alerting staff.. Fatal error detected");
    changeFloor = 0;
  }else {
    destinationFloor = 0;
    current.setLookAndFeel(orange);
    destination.setLookAndFeel(orange);
  }
  
}

void setLabel(IFButton button, String label){
  button.setLabel(label);
  redraw();
}

int changeFloorRoutine(int floor, int destination){
  if (destination < floor){
     floor = floor - 1;
  } else if (destination > floor) {
     floor = floor + 1;
  }
  setLabel(current, String.valueOf(floor));
  currentFloor = floor ;
  delay(500);
  loop();
  return floor;
}
