import java.util.*; 

String distant_text = "hello";
String close_text = "there";

float noise_scale = 200;
int font_size = 200;

color low_freq_fill = color(30);
int blur_radius = 10;
int high_freq_opacity = 35;

PGraphics highText;

PGraphics create_image(String close_text){
  PGraphics img = createGraphics(1200, 400);
  img.beginDraw();
  img.background(0,0,0);
  img.textAlign(CENTER);
  img.fill(255, 0, 0);
  
  PFont font = createFont("Arial Bold", font_size);
  img.textFont(font);
  img.noStroke();
  img.text(close_text, 600, 200);
  return img;
}

void drawScreen(){
  // Add background noise
  addNoise(noise_scale);
  
  // Add low freq text
  text(distant_text, 600, 400);
  
  // Run through gaussian blur
  filter(BLUR, blur_radius);
  
  // Add highText to composition
  tint(255, high_freq_opacity);
  image(highText, 30, 200);
}

void setup(){
  size(1200, 800);
  textAlign(CENTER);
  noStroke();
  PFont font = createFont("Arial Bold",font_size);
  textFont(font);
  fill(low_freq_fill);

  // Render high freq text and filter it to highText PGraphics
  highText = create_image(close_text);
  highText = distance_fill(highText);
  highText = distance_filter(highText);
  
  drawScreen();
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
