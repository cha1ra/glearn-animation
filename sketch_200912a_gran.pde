// https://processing.org/reference/libraries/sound/Amplitude_analyze_.html
import processing.sound.*;
Amplitude amp;
AudioIn in;


PImage img;

void setup()
{
  size(700, 700);  
  background(255, 255, 255); 
  
  img = loadImage("./src/normal.png");
  
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

//プログラムを実行したとき、ループして実行されるブロック
void draw()
{
    background(255, 255, 255); 
  
    float ampNum = amp.analyze();    
    // グラン君のサイズ調整用
    float imgAddSize = floor(ampNum*200);
    
    imageMode(CENTER);
    image(img, width/2, height/2, 500, 500 + imgAddSize);

    
    println(imgAddSize);
}
