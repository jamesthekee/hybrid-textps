import java.util.*; 

String distant_text = "i love";
String close_text = "fat cock";

float noise_scale = 200;

PGraphics create_image(){
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

// Input a binary mask image.
// Pixels part have RGB values (0,255,0)s
// Pixels excluded have RGB (0,0,0)
/*
R - corresponds to being in the mask (0 or 255)
G - corresponds to being in the mask, and already being considered (0 or 255)
B - corresponds to the distance from the edge of mask. (0 - 255) inclusive
*/
PGraphics distance_fill(PGraphics maskImage){
  int[] adjacency = {-maskImage.width, -1, 1, maskImage.width};
  int index;
  
  HashSet<Integer> cur = new HashSet<Integer>();
  maskImage.loadPixels();
  
  // For every pixel in the image
  // if in the text, ie not black
  // and adjacent to black add to cur
  // and set colour green.
  
  for(int x=0; x< maskImage.width; x++){
    for(int y=0; y< maskImage.height; y++){
      
      index = x + y*maskImage.width;
      if(maskImage.pixels[index] != color(0)){
        for(int k: adjacency){
          if(maskImage.pixels[index+k] == color(0)){
            cur.add(index);
            maskImage.pixels[index] = color(0, 255, 0);
            break;
          }
        }
      }
    }
  }
  
  // Now just keep adding adjacent pixels to the current ones
  // Colour in others
  
  HashSet<Integer> next;
  int depth = 1;
  while(cur.size() > 0){
    next = new HashSet<Integer>();
    for(int i: cur){
      for(int k: adjacency){
        if(red(maskImage.pixels[i+k]) > 0)
          next.add(i+k);
      }
      maskImage.pixels[i] = color(0, 255, depth);
    }
    depth++;
    cur = next;
  }
  
  maskImage.updatePixels();
  maskImage.endDraw();
  return maskImage;
}

void setup(){
  size(1200, 800);
  textAlign(CENTER);
  fill(0);
  noStroke();

  PGraphics img = create_image();
  
  
  
  
  
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
