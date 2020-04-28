class ball {
  float x,y;       //position
  float dir;       // angle
  float scale;     // scale value
  float speed;     // how fast (distance)
  color curCol;    // current color
  float curDiam;   // current diameter
  boolean isTouch; // are two shapes overlapping?
  
  ball(float size){
    x = width*.5;
    y = height*.5;
    dir = random(360);
    curDiam = size;
    curCol = #FFFCFC; //<>//
    speed = random(.1,3);
        
  }
  void update(){
    float jitter;
    float sign;
    float maxJitter = 20;
    
    speed = (random(100)>5)?speed:random(.1,3);
    jitter = pow(random(0,1),1+speed);
    sign = (random(100)>50)?-1:1;
    dir = dir + sign*jitter*maxJitter;
    x += speed * cos(radians(dir));
    y += speed * sin(radians(dir));
    
    if (x < 0 || x > width) {
         dir = 180 - dir;   // bounce 
    }
    else if (y < 0 ||y > height) {
         dir = 360 - dir;   // bounce
    }

  }
  void display(){
        
    fill(curCol);
    noStroke();
    ellipse(x,y,curDiam,curDiam);
    fill(hue(curCol),saturation(curCol),brightness(curCol),50);
    ellipse(x,y,curDiam*3,curDiam*3);
  }
}