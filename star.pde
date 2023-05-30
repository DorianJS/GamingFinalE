class Star {
  float x;
  float y;
  float size;
  
  Star(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = 5;
  }
  
  void update() {

    y += scrollSpeed;
    
   
    if (y > height) {
      y = 0; 
    }
  }
  
  void display() {
    fill(255);
    ellipse(x, y, size, size);
  }
}
