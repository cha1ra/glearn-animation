// https://processing.org/reference/libraries/sound/Amplitude_analyze_.html
import processing.sound.*;
Amplitude amp;
AudioIn in;

PImage img;

void setup()
{
  size(700, 700);  
  
  img = loadImage("./src/normal.png");
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw()
{
    background(255, 255, 255); 
  
    float ampNum = amp.analyze();    
    // グラン君のサイズ調整用
    float imgAddSize = floor(ampNum*200);
    
    imageMode(CENTER);
    image(img, width/2, height/2, 500, 500 + imgAddSize);
}

void keyPressed() {
  switchImageUrl(key);
}

void switchImageUrl(char key) {
  String src = "";
  switch(key){
    case '1':
      src = "./src/normal.png";
      break;
    case '2':
      src = "./src/point.png";
      break;
    case '3':
      src = "./src/surprise.png";
      break;
    default:
      src = "./src/normal.png";
      break;
  }
  img = loadImage(src);
}
