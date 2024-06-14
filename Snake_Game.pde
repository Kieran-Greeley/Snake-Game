//Snake Game By Kieran Greeley
//Main
ArrayList<Snake>snake;
Apples a;
boolean MoveLeft, MoveUp, MoveDown = false;
boolean MoveRight = true;
boolean GameStart = false;
boolean Reset = false;
int Score;
int HighScore;
void setup(){
  size(500, 500);
  background(0);
  frameRate(7);
  Score = 0;
  HighScore = 0;
  snake = new ArrayList<Snake>();
  a = new Apples(snake);
  for (int i = 0; i < 4; i++){
    snake.add(new Snake (int(125 - i * 25), 250));
  }
}
void draw(){
  background(0);
  //draws the apple
  fill(250, 0, 0);
  rect(a.GetAppX(), a.GetAppY(), a.GetAppSize(), a.GetAppSize());
  //draws the head of the snake a diffrent color to make it obvious to the user
  for (int i = snake.size() - 1; i >= 0; i--){
    if (i == 0){
      fill(0, 0, 250);
      rect(snake.get(i).GetSnakeX(), snake.get(i).GetSnakeY(), snake.get(i).GetSnakeSize(), snake.get(i).GetSnakeSize());
    }else{
      fill(0, 0, 200);
      rect(snake.get(i).GetSnakeX(), snake.get(i).GetSnakeY(), snake.get(i).GetSnakeSize(), snake.get(i).GetSnakeSize());
    }
  }
  // checks if the snake has gone off screen or has "hit the wall"
  //if so it will end the game
  if (snake.get(0).GetSnakeX() >= 500 || snake.get(0).GetSnakeX() <= -25 || snake.get(0).GetSnakeY() >= 500 || snake.get(0).GetSnakeY() <= -25){
    GameStart = false;
  }
  if (Reset == true && GameStart == false){
    snake.clear();
    Score = 0;
    MoveRight = true;
    for (int i = 0; i < 4; i++){
      snake.add(new Snake(125 - i * 25, 250));
    }
  }
  // uses the booleans from the keypress method and uses it to tell the snake were to move in the x/y axis
  // also checks it the head of the snake is over an apple and if so will make the snake one tile bigger and make a new apple
  if (GameStart == true){
    if (MoveRight == true){
      if (snake.get(0).GetSnakeX() == a.GetAppX() && snake.get(0).GetSnakeY() == a.GetAppY()){
        snake.add(0, new Snake(snake.get(0).GetSnakeX() + 25, snake.get(0).GetSnakeY()));
        a = new Apples(snake);
        Score++;
      }else {
        snake.add(0, new Snake(snake.get(0).GetSnakeX() + 25, snake.get(0).GetSnakeY()));
        snake.remove(snake.size() - 1);
      }
    }else if(MoveUp == true){
      if (snake.get(0).GetSnakeX() == a.GetAppX() && snake.get(0).GetSnakeY() == a.GetAppY()){
        snake.add(0, new Snake(snake.get(0).GetSnakeX(), snake.get(0).GetSnakeY() - 25));
        a = new Apples(snake);
        Score++;
      } else {
        snake.add(0, new Snake(snake.get(0).GetSnakeX(), snake.get(0).GetSnakeY() - 25));
        snake.remove(snake.size() - 1);
      }
    }else if(MoveDown == true){
      if (snake.get(0).GetSnakeX() == a.GetAppX() && snake.get(0).GetSnakeY() == a.GetAppY()){
        snake.add(0, new Snake(snake.get(0).GetSnakeX(), snake.get(0).GetSnakeY() + 25));
        a = new Apples(snake);
        Score++;
      } else {
        snake.add(0, new Snake(snake.get(0).GetSnakeX(), snake.get(0).GetSnakeY() + 25));
        snake.remove(snake.size() - 1);
      }
    }
    else if(MoveLeft == true){
      if (snake.get(0).GetSnakeX() == a.GetAppX() && snake.get(0).GetSnakeY() == a.GetAppY()){
        snake.add(0, new Snake(snake.get(0).GetSnakeX() - 25, snake.get(0).GetSnakeY()));
        a = new Apples(snake);
        Score++;
      } else {
        snake.add(0, new Snake(snake.get(0).GetSnakeX() - 25, snake.get(0).GetSnakeY()));
        snake.remove(snake.size() - 1);
      }
    }
  }
  Reset = false;
  // tells the user the current score and snake lenght
  fill(256, 256, 256);
  textSize(13);
  if (Score > HighScore){
    HighScore = Score;
  }
  text("High Score: " + HighScore, 10, 20);
  text("Current Score: " + Score, 110, 20);
  text("Snake Length: " + snake.size(), 230 ,20);
  // checks if the head of the snake has run into any other part of the snake
  for (int i = 1; i < snake.size(); i++){
    if (snake.get(0).GetSnakeX() == snake.get(i).GetSnakeX() && snake.get(0).GetSnakeY() == snake.get(i).GetSnakeY()){
      GameStart = false;
    }
  }
  // win condition
  if (snake.size() == 100){
    GameStart = false;
    textSize(40);
    text("You Win!", 150, 250);
  }
  //tell the user how to start and reset the game
  if (GameStart == false){
    textSize(40);
    text("Press Space to Start", 75, 200);
    text("Press R to Reset", 100, 300);
  }
}
void keyPressed(){
  //this checks what direction the snake should move in next and prevents the user from truning into themselves
  if (keyCode == LEFT && MoveRight != true){
    MoveLeft = true;
    MoveUp = false;
    MoveRight = false;
    MoveDown = false;
  }else if (keyCode == UP && MoveDown != true){
    MoveUp = true;
    MoveLeft = false;
    MoveRight = false;
    MoveDown = false;
  }else if (keyCode == RIGHT && MoveLeft != true){
    MoveRight = true;
    MoveUp = false;
    MoveLeft = false;
    MoveDown = false;
  }else if(keyCode == DOWN && MoveUp != true){
    MoveDown = true;
    MoveUp = false;
    MoveRight = false;
    MoveLeft = false;
  }
  // to start the game
  if (key == ' '){
    GameStart = true;
  }
  // to reset the snake
  if (key == 'r' || key == 'R'){
    Reset = true;
  }
}
