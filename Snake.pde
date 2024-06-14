//snake class
public class Snake{
  int SnakeX, SnakeY, SnakeSize;
  Snake(int X, int Y){
    SnakeX = X;
    SnakeY = Y;
    SnakeSize = 25;
  }
  int GetSnakeX(){
    return SnakeX;
  }
  int GetSnakeY(){
    return SnakeY;
  }
  int GetSnakeSize(){
    return SnakeSize;
  }
}
