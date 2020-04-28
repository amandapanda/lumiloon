int numCrits = 300;
balloons[] crits = new balloons[numCrits];
//balloons ball = new balloons( color color(#D32F2F), float 50);
ball ball;
boolean drag = false;

void setup(){
  size (1000,600);
  background(#6E7167);
  colorMode(HSB,360,100,100,100); 
  ball = new ball(50);
  for (int i= 0; i<numCrits; i++){
    crits[i] = new balloons();
  }
}

void draw(){
  background(#6E7167);
  //fill(#6E7167,35);
  //rect(0,0,width,height);
  if(mousePressed == false && drag == false){
    ball.update();
  }
  
  for (int i= 0; i<numCrits; i++){
    crits[i].update();
    crits[i].display();
  }
  ball.display();
}

void mousePressed(){
  ball.x = mouseX;
  ball.y = mouseY;
  drag = true;
}

void mouseDragged(){
  ball.x = mouseX;
  ball.y = mouseY;
}

void mouseReleased(){
  drag = false;
}