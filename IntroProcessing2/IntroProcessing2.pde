
color bcolor = color(51);
color boxColor = color(0);

float translateX = 0;
float translateY = 0;
float distance = 0;

float sensibility3D = 0.01;
float sensibility2D = 0.5;

boolean mode = false;

float boxSize = 400;
float rectSize = 600;
float redFactor = 0.5;
float greenFactor = 0.5;
float blueFactor = 0.5;

Collection balls;

int size = 20;

PVector wind = new PVector(10,0,0);

void setup() {
  size (900, 650, P3D);
  balls = new Collection(size, mode);
}

void draw() {
  background(bcolor);
  if (!mode) {
    pushMatrix();
    translate(width/2 + translateX - (rectSize/2), height/2 + translateY- (rectSize/2), -distance);
    noFill();
    stroke(0);
    rect(0, 0, rectSize, rectSize);
    translate(0, rectSize);
    rotateX(PI);
    balls.applyGravity();
    //balls.applyForce(wind);
    balls.update();
    balls.display2D();
    balls.checkEdges2D();
    popMatrix();
  } else {
    translate(width/2, height/2, -distance);
    rotateX(-translateY);
    rotateY(translateX);
    noFill();
    stroke(0);
    box(boxSize);
    translate(-boxSize/2, boxSize/2, boxSize/2);
    balls.applyGravity();
    //balls.applyForce(wind);
    balls.update();
    balls.display3D();
    balls.checkEdges3D();
  }
}

void mouseDragged() {
  if (mode) {
    translateX += (mouseX-pmouseX)*sensibility3D;
    translateY += (mouseY-pmouseY)*sensibility3D;
  } else {
    translateX += (mouseX-pmouseX)*sensibility2D;
    translateY += (mouseY-pmouseY)*sensibility2D;
  }
}

/*
  Funcion para el control de rotacion dado 
 por el teclado
 */
void keyPressed() {
  if (keyCode == UP) {
    distance -= 10;
  }
  if (keyCode == DOWN) {
    distance += 10;
  }
  if (keyCode == RIGHT) {
    if (mode)
      translateX += sensibility3D;
    else
      translateX += sensibility2D*10;
  }
  if (keyCode == LEFT) {
    if (mode)
      translateX -= sensibility3D;
    else
      translateX -= sensibility2D*10;
  }
  if (keyCode == 'R' || keyCode == 'r') {
    translateX = 0;
    translateY = 0;
    distance = 0;
  }
  if (keyCode == 'W' || keyCode == 'w') {
    distance -= 50;
  }
  if (keyCode == 'S' || keyCode == 's') {
    distance += 50;
  }
  if (keyCode == 'D' || keyCode == 'd') {
    if (mode)
      translateX += sensibility3D*5;
    else
      translateX += sensibility2D*20;
  }
  if (keyCode == 'A' || keyCode == 'a') {
    if (mode)
      translateX -= sensibility3D*5;
    else
      translateX -= sensibility2D*20;
  }
  if (keyCode == 'C' || keyCode == 'c') {
    mode = !mode;
    translateX = 0;
    translateY = 0;
    distance = 0;
    balls = new Collection(size, mode);
  }
  if (keyCode == 'm' || keyCode == 'M') {
    size++;
    if (size > 50)
      size = 50;
    balls = new Collection(size, mode);
  }
  if (keyCode == 'n' || keyCode == 'N') {
    size--;
    if (size <= 0)
      size = 1;
    balls = new Collection(size, mode);
  }
}