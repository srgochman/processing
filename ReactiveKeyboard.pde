import processing.sound.*;
Amplitude amp;
AudioIn in;
PFont soft, reg, loud, style;
float w, h;
//String typing = "";
//StringList message = new StringList();
//StringDict dict;
ArrayList<Item> message = new ArrayList<Item>();
int count = 1;

void setup() {
  size(600, 400);
  background(255);
  fill(0);
  stroke(0);
  soft = createFont("RobotoMono-Light.ttf", 16);
  reg = createFont("RobotoMono-Bold.ttf", 16);
  loud = createFont("RobotoMono-BoldItalic.ttf", 16);
  
  //dict = new StringDict();
    
  // Create the Input stream
  amp = new Amplitude(this);  
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}      

void draw() {
  background(255);
  
  // visualize
  h = map(amp.analyze(), 0, 0.1, 0, height);
  rect(0, height - h, 8, h);
  line(0, height - 40, 8, height - 40);
  line(0, height - 280, 8, height - 280);
  //println(h);
  
  // text styling based on amplitude
  if (h < 20) {
    //textFont(light);
    style = soft;
  }
  else if (h < 120) {
    //textFont(reg);
    style = reg;
  }
  else {
    //textFont(bold);
    style = loud;
  }
  for (int i = 0; i < message.size(); i++) {
    textFont(message.get(i).font);
    //if ((80 + i * 9) > 530) {
    //  count++;
      
    //}
    text(str(message.get(i).letter), 50 + i * 9, height/2, 440, 720);
    //println(message.get(i).letter);
  }
}

void keyPressed() {
  //typing += key;
  //dict.set(str(key), style);  
  message.add(new Item(key, style));
}




class Item { 
  char letter;
  PFont font; 
  Item (char l, PFont f) {  
    letter = l;
    font = f; 
  }
} 
