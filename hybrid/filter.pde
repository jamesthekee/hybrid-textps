PGraphics distance_filter(PGraphics img){
  img.loadPixels();
  
  int index;
  
  for(int x=0; x< img.width; x++){
    for(int y=0; y< img.height; y++){
      
      index = x + y*img.width;
      if(img.pixels[index] == color(0)){
        img.pixels[index] = color(255,255,255,0);
      }else{
        float depth = blue(img.pixels[index]);
        img.pixels[index] = color(depth*8);
      }
    }
  }
  img.updatePixels();
  return img;
}
