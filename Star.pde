class Star {
  int x, y;
  int size;
  float z;
  float sx, sy;
  float pz, px, py;

  Star() {
    z = random(width);
    reset();
  }

  void reset() {
    x = (int)random(-width/2, width/2);
    y = (int)random(-height/2, height/2);
    pz = z;
  }

  boolean timeToReset() {
    if (z < 1) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    z = z - speed;
    if (timeToReset()) {
      z = width;
      reset();
    }
  }

  void show() {
    noStroke();
    fill(255);

    sx = map(x / z, 0, 1, 0, width);
    sy = map(y / z, 0, 1, 0, height);
    size = (int)map(z, 0, width, 10, 1);

    ellipse(sx, sy, size, size);

    px = map(x / pz, 0, 1, 0, width);
    py = map(y / pz, 0, 1, 0, height);

    pz = z;
    stroke(255);
    strokeWeight(size);
    line(px, py, sx, sy);
  }

  void movingLeft() {
    x = x + movingSpeed;
  }
  void movingRight() {
    x = x - movingSpeed;
  }
  void movingUp() {
    y = y + movingSpeed;
  }
  void movingDown() {
    y = y - movingSpeed;
  }
}