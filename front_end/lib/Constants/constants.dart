import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:hurry_up_henry/Providers/obstacle.dart';

// seperate enum for action types and directions to avoid confusion
enum ActionType { Delete, Run, Restart, MoveUp, MoveDown, MoveLeft, MoveRight }
enum Direction { Up, Down, Left, Right }

extension ActionExtension on ActionType {
  int get buttonIndex {
    switch (this) {
      case ActionType.MoveUp:
        return 1;
      case ActionType.MoveLeft:
        return 4;
      case ActionType.Run:
        return 3;
      case ActionType.MoveRight:
        return 6;
      case ActionType.MoveDown:
        return 9;
      case ActionType.Delete:
        return 7;
      case ActionType.Restart:
        return 11;
    }
  }

// link direction to related actions
  get direction {
    switch (this) {
      case ActionType.MoveUp:
        return Direction.Up;
      case ActionType.MoveLeft:
        return Direction.Left;
      case ActionType.Run:
        break;
      case ActionType.MoveRight:
        return Direction.Right;
      case ActionType.MoveDown:
        return Direction.Down;
      case ActionType.Delete:
        break;
      case ActionType.Restart:
        break;
    }
  }
}

enum Levels { Easy, Medium, Hard }

//sound effects
AudioPlayer player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
final winSFXpath = "assets/sounds/win.wav";
final loseSFXpath = "assets/sounds/lose.wav";
final moveSFXpath = "assets/sounds/move.wav";

// setting as abstract class to prevent from instantiation
abstract class Constants {
  // http constants
  static const url = 'cube.atombox.net:8088';
  static const apikey = 'special-key';

  // images
  static const redCar = 'assets/images/redCar.png';
  static const henry = 'assets/images/henry.png';
  static const goal = 'assets/images/house.png';
  static const obstalceImage = 'assets/images/obstacles.png';
  static const gridBackground = 'assets/images/backGround.jpg';
  static const consoleFrame = 'assets/images/monkey.png';
  static const upButton = 'assets/images/arrowUp.png';
  static const downButton = 'assets/images/arrowDown.png';
  static const leftButton = 'assets/images/arrowLeft.png';
  static const rightButton = 'assets/images/arrowRight.png';
  static const runButton = 'assets/images/drive.png';
  static const restartButton = 'assets/images/restart.png';
  static const deleteButton = 'assets/images/delete.png';

  // screen constants
  static const double consoleIconSize = 50;
  static const gridSize = 50;
  static const Color consoleColor = Color(0xff7cb342);
  static const controlGridNumber = 12;
  static const buttonIconSize = 50;
  static const Color directionButtonColor = Colors.blue;

  static const secondsDelayed = 3; //seconds between front end player movement
  static int gridNum = 16; //this does work, how about that.

  //should be in an obstacle manager or something
  static List<Obstacle> obstacles = [];
  static List<int> obstaclePositions = [];
  static bool checkObstacleExists(int index, obstacles) {
    for (Obstacle obstacle in obstacles) {
      if (obstacle.getPosition() == index) {
        return true;
      }
    }
    return false;
  }
}
