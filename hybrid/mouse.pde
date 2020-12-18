int bx, by;
int frames = 1;

void mousePressed(){
  bx = mouseX;
  by = mouseY;
}

void mouseReleased(){
  xshift += mouseX-bx;
  yshift += mouseY-by;
  
  println(xshift, yshift);
  drawScreen();
}

void keyPressed(){
  if(key == 's'){
    save("output-" + frames + ".png");
    frames++;
  }
}
