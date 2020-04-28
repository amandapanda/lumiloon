class balloons {
  float x,y;       //position
  float dir;       // angle
  float scale;     // scale value
  float speed;     // how fast (distance)
  color curCol;    // current color
  float hue = 10;
  float hueStep = 10;
  float curDiam;   // current diameter
  float lineLength; // pointer line length
  float ptrAngle;   // angle to point to special 
  
  balloons(){
    x = random(width);
    y = random(height);
    dir = random(360);
    curDiam = 20;
    curCol = color(#9B0B0B);
    speed = random(.1,3);
    lineLength = 50;
        
  }
  balloons(float size){
    x = random(width);
    y = random(height);
    dir = random(360);
    curDiam = size;
    curCol = color(#ffffff);
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
    // determine the angle to the special balloons
    ptrAngle = atan2(ball.y-y, ball.x-x);
  }
  
  void display(){
    noStroke();
    float distance;
    float minDist = 0;
    float maxDist = pow(pow(width,2)+pow(height,2),.5)-100;
    float maxDiam = 10;
    float minDiam = 300;
    float minHue = 0;
    float maxHue = 360;
    float minLength = dist(ball.x,ball.y,x,y);
    float maxLength = dist(ball.x,ball.y,x,y);
    
    distance = dist(ball.x,ball.y,x,y);
    curDiam = map(distance,minDist,maxDist,maxDiam,minDiam);
    hue = map(distance,minDist,maxDist,maxHue,minHue);
    lineLength = map(distance,minDist,maxDist,minLength,maxLength);
    fill(hue,50,100);
    ellipse(x,y,curDiam,curDiam);
    
    // create the pointer
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(x,y);
    rotate(ptrAngle);
    translate(-x,-y);
    stroke(hue,50,100);
    line(x,y,x+lineLength,y);
    popMatrix();
  }
}