float currentDepth;  

void setup() {
  size(displayWidth, displayHeight);
  drawTree();
}

void draw() {
  if (mousePressed == true) {
    drawTree();
  }
}

void drawTree() {


  //background(random(100,150),random(100,150),random(100,150));
  background(255);
  translate(width/2, height-200);
  int depth = 13;
  strokeWeight(depth*1.25);
  //stroke(random(0,255),random(0,255),random(0,255),255);
  stroke(0);
  line(0, 200, 0, 0);
  branch(depth);
}


void branch(int depth) {
  pushMatrix();                    // store the old state
  rotate(radians(random(0, 45)));   // rotate
  subBranch(depth);                // and draw one branch
  popMatrix();                     // go back to old state
  rotate(radians(random(-45, -0))); // rotate the other way
  subBranch(depth);                // and draw another branch
}

void subBranch(int depth) {
  scale(0.8);
  int len = (int) random(0, 200);
  translate(0, -len);
  strokeWeight(depth*1.5);
  line(0, len, 0, 0);
  //fill(random(0,255),random(0,255),random(0,255));
  fill(0, 175);
  //if(depth == 0) {ellipse(0,0,70,80);}
  if (depth > 0) branch(depth-1);
}

boolean sketchFullScreen() {
  return true;
}
