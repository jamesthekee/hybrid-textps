import java.util.*; 

PGraphics create_image(String close_text){
  PGraphics img = createGraphics(1200, 400);
  img.beginDraw();
  img.background(0,0,0);
  img.textAlign(CENTER);
  img.fill(255, 0, 0);
  
  PFont font = createFont("Arial Bold", 200);
  img.textFont(font);
  img.noStroke();
  img.text(close_text, 600, 200);
  return img;
}


void setup(){
  size(1200, 800);
  textAlign(CENTER);
 
  
  String distant_text = "i love you";
  String close_text = "i love bum";

  float noise_scale = 200;

  PGraphics img = create_image(close_text);
  img = distance_fill(img);
  img = distance_filter(img);
  
  addNoise(noise_scale);
  
  
  PFont font = createFont("Arial Bold", 200);
  fill(30);
  noStroke();
  textFont(font);
  text(distant_text, 600, 400);
  
  filter(BLUR, 10);
  tint(255, 35);
  image(img, 30, 200);
}

void addNoise(float noise_scale){
  loadPixels();
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      pixels[x+ y*width] = color(map(noise(x/noise_scale, y/noise_scale), 0, 1, 50, 200));
    }
  }
  updatePixels();
}
