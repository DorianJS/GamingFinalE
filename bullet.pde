class Bullet {
  float x;
  float y;
  float size;
  float speed;
  
  Bullet(float x, float y, float size, float speed) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = 8;
  }
  
  void update() {
    y -= speed;  
    
   
    if (y < 0) {
      isBulletActive = false;
    }
  }
  
  void display() {
    fill(255, 0, 0);
    ellipse(x, y, size, size);
  }
  
  boolean hits(Alien alien) {
    float d = dist(x, y, alien.x, alien.y);
    return d < (size + alien.size) / 2;
  }

boolean hits2(Player player){
 float e = dist(x,y,player.x,player.y); 
  return e < (size + player.size) / 2;
}



}
