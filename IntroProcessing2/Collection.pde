class Collection {
  ArrayList<Ball> list;
  float gravity = 9.81;

  Collection(int size, boolean mode) {
    list = new ArrayList<Ball>();
    for (int i = 0; i < size; i++) {
      list.add(new Ball(mode));
    }
  }

  Collection(ArrayList<Ball> ballList) {
    list = ballList;
  }

  void applyForce(PVector force) {
    for (int i = 0; i < list.size(); i++) {
      list.get(i).applyForce(force);
    }
  }

  void update() {
    for (int i = 0; i < list.size(); i++) {
      list.get(i).update();
    }
  }

  void checkEdges2D() {
    for (int i = 0; i < list.size(); i++) {
      list.get(i).checkEdges2D();
    }
  }
  
  void checkEdges3D() {
    for (int i = 0; i < list.size(); i++) {
      list.get(i).checkEdges3D();
    }
  }

  void applyGravity() {
    for (int i = 0; i < list.size(); i++) {
      list.get(i).applyGravity(gravity);
    }
  }

  void collisions() {
    for (int i = 0; i < list.size(); i++) {
      Ball origin = list.get(i);
      for (int j = 0; j < list.size(); j++) {
        if (i != j) {
          Ball destiny = list.get(j);
          if(origin.isClose(destiny)){
            
          }
        }
      }
    }
  }

  void display2D() {
    for (int i = 0; i < list.size(); i++) {
      list.get(i).display2D();
    }
  }
  
  void display3D() {
    for (int i = 0; i < list.size(); i++) {
      list.get(i).display3D();
    }
  }
}