class Ball {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float size = 10;
  float animationRate = 0.1;

  Ball(boolean mode) {
    float posx, posy, posz;
    if (!mode) {
      posx = random(0, rectSize);
      posy = random(0, rectSize);
      posz = random(0, rectSize);
    } else {
      posx = random(0, boxSize);
      posy = random(0, boxSize);
      posz = random(0, boxSize);
    }
    pos = new PVector(posx, posy, posz);
    //vel = PVector.random2D();
    vel = new PVector(0, random(0, 5), 0);//PVector.random2D().normalize();
    acc = new PVector(0, 0);
    mass = 1;
  }

  Ball(PVector position) {
    pos = position;
    vel = PVector.random2D().normalize();
    acc = new PVector(0, 0);
    mass = 1;
  }

  Ball(PVector position, PVector velocity) {
    pos = position;
    vel = velocity;
    acc = new PVector(0, 0);
    mass = 1;
  }

  void applyForce(PVector force) {
    PVector f = PVector.mult(force, animationRate);
    acc.add(PVector.div(f, mass));
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }

  void checkEdges2D() {
    if (pos.x + (size/2) > rectSize) {
      pos.x = rectSize - (size/2);
      vel.x *= -1;
    } else if (pos.x - (size/2) < 0) {
      vel.x *= -1;
      pos.x = (size/2);
    }
    if (pos.y + (size/2) > rectSize) {
      pos.y = rectSize - (size/2);
      vel.y *= -1;
    } else if (pos.y - (size/2) < 0) {
      vel.y *= -1;
      pos.y = (size/2);
    }
  }

  void checkEdges3D() {
    if (pos.x + (size/2) > boxSize) {
      pos.x = boxSize - (size/2);
      vel.x *= -1;
    } else if (pos.x - (size/2) < 0) {
      vel.x *= -1;
      pos.x = (size/2);
    }
    if (pos.y + (size/2) > boxSize) {
      pos.y = boxSize - (size/2);
      vel.y *= -1;
    } else if (pos.y - (size/2) < 0) {
      vel.y *= -1;
      pos.y = (size/2);
    }
    if (pos.z + (size/2) > boxSize) {
      pos.z = boxSize - (size/2);
      vel.z *= -1;
    } else if (pos.y - (size/2) < 0) {
      vel.z *= -1;
      pos.z = (size/2);
    }
  }

  void applyGravity(float gravity) {
    PVector force = new PVector(0, -(mass*gravity), 0);
    applyForce(force);
  }

  void display2D() {
    float red = map(pos.x, 0, rectSize, 0, 255);
    float green = map(pos.y, 0, rectSize, 0, 255);
    float blue = 0;     //map(dist(0, 0, pos.x, pos.y), 0, dist(0, 0, width, height), 0, 255);
    fill(red, green, blue);
    stroke(0);
    ellipse(pos.x, pos.y, size, size);
  }

  void display3D() {
    float red = map(pos.x, 0, boxSize, 0, 255);
    float green = map(pos.y, 0, boxSize, 0, 255);
    float blue = map(pos.z, 0, boxSize, 0, 255);
    fill(red, green, blue);
    stroke(red, green, blue, 10);
    pushMatrix();
    translate(pos.x, -pos.y, -pos.z);
    sphere(size);
    popMatrix();
  }

  boolean isClose(Ball destiny) {
    if (dist(pos.x, pos.y, pos.z, destiny.pos.x, destiny.pos.y, destiny.pos.z) <= size) {
      return true;
    } else {
      return false;
    }
  }
}