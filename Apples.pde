//Apples class
public class Apples{
  int AppX, AppY;
  int AppSize;
  Apples(ArrayList<Snake> snake){
    // creates a random location for the apple
    AppX = int(random(20)) * 25;
    AppY = int(random(20)) * 25;
    AppSize = 25;
    // makes a new random location for the apple if the snake was occupying the previous one
    for (int i = 0; i < snake.size(); i++){
      if (AppX == snake.get(i).GetSnakeX()){
        AppX = int(random(20)) * 25;
      }else if (AppY == snake.get(i).GetSnakeY()){
        AppY = int(random(20)) * 25;
      }
    }
  }
  int GetAppX(){
    return AppX;
  }
  int GetAppY(){
    return AppY;
  }
  int GetAppSize(){
    return AppSize;
  }
}
