import 'package:hurry_up_henry/Constants/constants.dart';

class Difficulty {
  Levels currentLevel = Levels.Easy;

  void levelUp() {
    switch (currentLevel) {
      case Levels.Easy:
        {
          currentLevel = Levels.Medium;
        }
        break;
      case Levels.Medium:
        {
          currentLevel = Levels.Hard;
        }
        break;
      case Levels.Hard:
        {
          //nothing? win the game?
        }
        break;
    }
  }

  int getGridSize() {
    switch (currentLevel) {
      case Levels.Easy:
        {
          return 16; // 4x4
        }
      case Levels.Medium:
        {
          return 36; // 6x6
        }

      case Levels.Hard:
        {
          return 64; // 8x8
        }
    }
  }

  int getNumOfObstaces() {
    switch (currentLevel) {
      case Levels.Easy:
        {
          return 0; // No obstacles
        }
      case Levels.Medium:
        {
          return 1; // One obstacle
        }
      case Levels.Hard:
        {
          return 3; // It's possible for the solution to become impossible with 2 obstacles or more
        }
    }
  }
  //get obstacle number
  //get min distance
  //..etc.
}
