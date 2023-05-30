int numStars = 100;  
Star[] stars;
float scrollSpeed = 1.0; 
int numAliens = 5;  
Alien[] aliens; 
Player player;
boolean isBulletActive = false;  
Bullet playerBullet;  
boolean isAlienBulletActive = false;  
Bullet[] alienBullets;
int numAlienBullets = 5;  
int score = 0; 
int level = 1; 
int maxLevel = 10;
int playerHealth = 3;  
boolean gameEnded = false;  
int frames; 
void setup() {
  size(400, 400);
  resetGame();
  frames = 3600;
  
  stars = new Star[numStars];
  for (int i = 0; i < numStars; i++) {
    stars[i] = new Star(random(width), random(height), random(0.5, 2.0));
  }
}

void draw() {
  background(0);
  
 frames --;
  
  
  for (int i = 0; i < numStars; i++) {
    stars[i].update();
    stars[i].display();
  }
  
  
  for (int i = 0; i < numAliens; i++) {
    aliens[i].update();
    aliens[i].display();
    
    
    if (aliens[i].isAlive() && aliens[i].collides(player)) {
      playerHealth--;  
      if (playerHealth <= 0) {
        gameOver();  
      }
      resetPlayer();  
    }
    
   
    if (random(1) < 0.01 && !isAlienBulletActive) {
      int randomAlien = floor(random(numAliens));
      alienBullets[randomAlien] = new Bullet(aliens[randomAlien].x, aliens[randomAlien].y, 5, 3);
      isAlienBulletActive = true;
    }
    
   
    if (isAlienBulletActive && alienBullets[i].hits(aliens[i])) {
    
      if (playerHealth <= 0) {
        gameOver();  
      }
      isAlienBulletActive = false; 
    
    }
  }
  
  
  player.update();
  player.display();
  

  if (isBulletActive) {
    playerBullet.update();
    playerBullet.display();
    
    
    for (int i = 0; i < numAliens; i++) {
      if (aliens[i].isAlive() && playerBullet.hits(aliens[i])) {
        aliens[i].kill(); 
        isBulletActive = false;  
        score += 10;  
        break;
      }
    }
  }
  
  
  for (int i = 0; i < numAlienBullets; i++) {
    if (isAlienBulletActive) {
      alienBullets[i].update();
      alienBullets[i].display();
    }
  }
  

  fill(255);
  textSize(20);
  textAlign(LEFT);
  text("Score: " + score, 10, 30);
  text("Level: " + level, 10, 60);
  text("Time: " + frames/60, 10, 90);
  if ( frames <= 0){
   text("GAMEOVER", width/2,height/2); 
  noLoop();
}
  
  boolean allAliensDead = true;
  for (int i = 0; i < numAliens; i++) {
    if (aliens[i].isAlive()) {
      allAliensDead = false;
      break;
    }
  }
  
  if (allAliensDead) {
    level++;
    if (level > maxLevel) {
      text("YOU WIN!!", width/2,height /2);
      gameWin();
      noLoop();
    } else {
      
      increaseDifficulty();
      resetGame();
    }
  }
}

void resetGame() {
  
  aliens = new Alien[numAliens];
  for (int i = 0; i < numAliens; i++) {
    aliens[i] = new Alien((i + 1) * width / (numAliens + 1), height / 4, 40, 2);
  }
  
  
  resetPlayer();
  
  
  alienBullets = new Bullet[numAlienBullets];
  for (int i = 0; i < numAlienBullets; i++) {
    alienBullets[i] = new Bullet(0, 0, 5, 3);
  }
}

void increaseDifficulty() {
  for (int i = 0; i < numAliens; i++) {
    aliens[i].increaseSpeed(2);
    aliens[i].increaseSize(5);
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    player.moveLeft();
  } else if (keyCode == RIGHT) {
    player.moveRight();
  } else if (key == ' ') {
    if (!isBulletActive) {
      playerBullet = new Bullet(player.getX(), player.getY(), 10, 5);
      isBulletActive = true;
    }
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) {
    player.stopMoving();
  }
}

void resetPlayer() {
  player = new Player(width / 2, height - 60, 60, 5);
}

void gameOver() {
  gameEnded = true;
  noLoop();
}

void gameWin() {

  gameEnded = true;
 noLoop();
}
