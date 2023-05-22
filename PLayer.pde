class Player {
  float x;
  float y;
  float size;
  float speed;
  boolean movingLeft;
  boolean movingRight;
  PImage fly;
  Player(float x, float y, float size, float speed) {
    fly = loadImage("rocket1.png");
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = speed;
    this.movingLeft = false;
    this.movingRight = false;
  }
  
  void update() {
    if (movingLeft) {
      x -= speed;
    } else if (movingRight) {
      x += speed;
    }
    x = constrain(x, size / 2, width - size / 2);  // Keep player within screen bounds
  }
  
  void display() {
    fill(255);
    rectMode(CENTER);
    image(fly,x,y,size,size);
    rect(x, y, size, size);
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getSize() {
    return size;
  }
  
  void moveLeft() {
    movingLeft = true;
    movingRight = false;
  }
  
  void moveRight() {
    movingLeft = false;
    movingRight = true;
  }
  
  void stopMoving() {
    movingLeft = false;
    movingRight = false;
  }
}
