String distant_text = "i love";
String close_text = "FAT COCK";

float noise_scale = 200;

void setup(){
  size(1200, 800);
  textAlign(CENTER);
  
  //Draw blurry noise;
  
  //addNoise();
  
  PGraphics text1 = createGraphics(800, 600);
  text1.beginDraw();
  
  text1.textAlign(CENTER);
  text1.textSize(100);
  text1.fill(255, 0, 0);
  text1.noStroke();
  text1.text(close_text, 400, 300);
  
  text1.loadPixels();
  
  text1.endDraw();
  
  image(text1, 0,0);
}

void addNoise(){
  loadPixels();
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      pixels[x+ y*width] = color(map(noise(x/noise_scale, y/noise_scale), 0, 1, 50, 200));
    }
  }
  updatePixels();
}
