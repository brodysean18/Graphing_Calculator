final float X_MAX = 20;
final float Y_MAX = 20;
boolean mirror = true;

void drawPlane() {
  background(50);
  textAlign(CENTER, CENTER);
  stroke(140);
  line(300, 0, 300, 600);
  line(0, 300, 600, 300);
  for(int i = 0; i <= 600; i += 60) {
    line(i, 290, i, 310);
    line(290, i, 310, i);
    if(i != 300) {      
      text((int)((((float)i / 600) * (X_MAX * 2)) - X_MAX), i+2, 323);
      text((int)((((float)i / 600) * (Y_MAX * 2)) - Y_MAX), 323, i-2);
    }
    else {
      text(0, i+10, 323);
    }
  }
}

void drawFunc() {
  float x1=-1000, y1=0, x2=0, y2=0;
  float ny1=0, ny2=0;
  
  stroke(#608360);
  strokeWeight(2);
  for(float x = -X_MAX; x <= X_MAX; x += X_MAX / 2000) {
    /* EQUATION */
    float y = sqrt(16 - (x*x));
    
    
    float ny = -y;
    
    x2 = (x*(300/X_MAX))+300;
    y2 = 300-(y*(300/Y_MAX));
    
    if(x1 != -1000) {
      line(x1, y1, x2, y2);
    }
    
    if(mirror) {
      ny2 = 300 - (ny*(300/Y_MAX));
      if(x1 != -1000) {
        line(x1, ny1, x2, ny2);
      }
      ny1 = ny2;
    }
    
    x1 = x2;
    y1 = y2;
  }
}

void setup() {
  size(600, 600);
  drawPlane();
  drawFunc();
}
