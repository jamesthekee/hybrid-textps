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
        
        img.pixels[index] = depthToColour(depth, 0);
      }
    }
  }
  img.updatePixels();
  return img;
}

color depthToColour(float depth, int mode){
  
  if(mode == 0)return color(depth*8);
  else if(mode == 1){
    float k = 1-(depth%3);
    return color(k*128);
  }else if(mode == 2){
    float k = 1-(depth%3);
    if(k == 0){
      return color(0,0,0);
    }else{
      return color(255,255,255,0);
    }
  }
  return color(0);
  //
}
