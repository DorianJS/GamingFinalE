class Alien {
  float x;
  float y;
  float size;
  float speed;
  boolean alive;
  PImage red;
  Alien(float x, float y, float size, float speed) {
   red = loadImage("alien1.png");
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = speed;
    this.alive = true;
  }
  
  void update() {
    if (alive) {
      x += speed;
      if (x > width - size / 2 || x < size / 2) {
        speed *= -1;  
      }
    }
  }
  
  void display() {
    if (alive) {
      fill(0, 255, 0);
      image(red,x,y,size,size);
    }
  }
  
  boolean isAlive() {
    return alive;
  }
  
  void kill() {
    alive = false;
  }
  
  boolean collides(Player player) {
    float d = dist(x, y, player.getX(), player.getY());
    return d < (size + player.getSize()) / 2;
  }
  
  void increaseSpeed(float amount) {
    speed += amount;
  }
  
  void increaseSize(float amount) {
    size += amount;
  }
}
