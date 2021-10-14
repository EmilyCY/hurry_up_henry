import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:hurry_up_henry/Constants/constants.dart';
import 'package:hurry_up_henry/Services/api_manager.dart';
import 'move.dart';
import 'difficulty.dart';
import 'obstacle.dart';

class Controller with ChangeNotifier {
  int currentPosition = 0;
  int winCounter = 0;
  int goalPosition = 0;
  static Random randomNum = new Random();
  int startPosition = 0;
  List<Move> moves = [];
  Difficulty difficulty = new Difficulty();
  static Direction facing = Direction.Up;

  Controller() {
    currentPosition = randomNum.nextInt(Constants.gridNum - 1);
    newGame();
  }

  void getCurrentPosition() async {
    for (Move move in moves) {
      if (!isOutOfBounds(currentPosition, move.direction) &&
          !checkObstacleCollision(currentPosition, move.direction)) {
        currentPosition += move.positionChange;
        player.play(moveSFXpath);
        postInstruction(move);
        // check success to continue??
      } else {
        lose();
        break;
      }

      notifyListeners();
      print(currentPosition);
      await Future.delayed(Duration(seconds: 3));
    }
    this.moves = [];
    winCondition();
  }

  void newGame() {
    Constants.gridNum = difficulty.getGridSize();
    print(difficulty.getGridSize().toString());
    newGoal();
    moves = [];
    facing = Direction.Up;
    currentPosition = randomNum.nextInt(Constants.gridNum - 1);
    createObstacles(difficulty.getNumOfObstaces());
    notifyListeners();
  }

  void newGoal() {
    goalPosition = randomNum.nextInt(Constants.gridNum - 1);
  }

  void makeMove(ActionType action) {
    Move move = new Move(action.direction);
    this.moves.add(move);
    notifyListeners();
  }

  void deleteMove() {
    moves.removeLast();
    notifyListeners();
  }

  void winCondition() {
    currentPosition == goalPosition ? win() : lose();
  }

  void win() {
    player.play(winSFXpath);
    winCounter++;
    if (winCounter == 1) {
      difficulty.levelUp();
      winCounter = 0;
    }
    newGame();
  }

  void lose() {
    player.play(loseSFXpath);
    print("lose");
    moves = [];
    notifyListeners();
  }

  void createObstacles(int obstacleNum) {
    Constants.obstacles = [];
    if (difficulty.getNumOfObstaces() > 0) {
      for (var i = 0; i < difficulty.getNumOfObstaces(); i++) {
        Obstacle obstacle = new Obstacle();
        obstacle.setRandomPosition();
        Constants.obstacles.add(obstacle);
        Constants.obstaclePositions[i] = Constants.obstacles[i].getPosition();
      }
    }
  }

  bool isOutOfBounds(int currentPosition, Direction direction) {
    switch (direction) {
      case Direction.Left:
        {
          if (currentPosition % sqrt(Constants.gridNum) != 0) {
            return false;
          }
        }
        break;
      case Direction.Right:
        {
          if (currentPosition % sqrt(Constants.gridNum) !=
              sqrt(Constants.gridNum) - 1) {
            return false;
          }
        }
        break;
      case Direction.Up:
        {
          if (currentPosition - sqrt(Constants.gridNum) >= 0) {
            return false;
          }
        }
        break;
      case Direction.Down:
        {
          if (currentPosition + sqrt(Constants.gridNum) <= Constants.gridNum) {
            return false;
          }
        }
        break;
    }
    return true;
  }

  bool checkObstacleCollision(int currentPosition, Direction direction) {
    switch (direction) {
      case Direction.Left:
        {
          if (Constants.checkObstacleExists(
              currentPosition - 1, Constants.obstacles)) {
            return true;
          }
        }
        break;
      case Direction.Right:
        {
          if (Constants.checkObstacleExists(
              currentPosition + 1, Constants.obstacles)) {
            return true;
          }
        }
        break;
      case Direction.Up:
        {
          int upPosition = currentPosition - sqrt(Constants.gridNum).toInt();
          if (Constants.checkObstacleExists(upPosition, Constants.obstacles)) {
            return true;
          }
        }
        break;
      case Direction.Down:
        {
          int downPosition = currentPosition + sqrt(Constants.gridNum).toInt();
          if (Constants.checkObstacleExists(
              downPosition, Constants.obstacles)) {
            return true;
          }
        }
        break;
    }
    return false;
  }

  void postInstruction(Move move) {
    if (move.direction == Direction.Up && facing == Direction.Up) {
      //post drive
      APIManager.postDrive();
      facing = Direction.Up;
    } else if (move.direction == Direction.Up && facing == Direction.Down) {
      // post reverse
      APIManager.postReverse();
      facing = Direction.Down;
    } else if (move.direction == Direction.Up && facing == Direction.Left) {
      // post true, drive
      APIManager.postRotatDrive(true);
      facing = Direction.Up;
    } else if (move.direction == Direction.Up && facing == Direction.Right) {
      // post false, drive
      APIManager.postRotatDrive(false);
      facing = Direction.Up;
    } else if (move.direction == Direction.Down && facing == Direction.Up) {
      // post reverse
      APIManager.postReverse();
      facing = Direction.Up;
    } else if (move.direction == Direction.Down && facing == Direction.Down) {
      // post drive
      APIManager.postDrive();
      facing = Direction.Down;
    } else if (move.direction == Direction.Down && facing == Direction.Left) {
      // post false, drive
      APIManager.postRotatDrive(false);
      facing = Direction.Down;
    } else if (move.direction == Direction.Down && facing == Direction.Right) {
      // post true, drive
      APIManager.postRotatDrive(true);
      facing = Direction.Down;
    } else if (move.direction == Direction.Left && facing == Direction.Up) {
      // post false, drive
      APIManager.postRotatDrive(false);
      facing = Direction.Left;
    } else if (move.direction == Direction.Left && facing == Direction.Down) {
      // post true, left
      APIManager.postRotatDrive(true);
      facing = Direction.Left;
    } else if (move.direction == Direction.Left && facing == Direction.Left) {
      // post drive
      APIManager.postDrive();
      facing = Direction.Left;
    } else if (move.direction == Direction.Left && facing == Direction.Right) {
      // post reverse
      APIManager.postReverse();
      facing = Direction.Right;
    } else if (move.direction == Direction.Right && facing == Direction.Up) {
      // post true, drive
      APIManager.postRotatDrive(true);
      facing = Direction.Right;
    } else if (move.direction == Direction.Right && facing == Direction.Down) {
      // post false, drive
      APIManager.postRotatDrive(false);
      facing = Direction.Right;
    } else if (move.direction == Direction.Right && facing == Direction.Left) {
      // post reverse
      APIManager.postReverse();
      facing = Direction.Left;
    } else if (move.direction == Direction.Right && facing == Direction.Right) {
      //post drive
      APIManager.postDrive();
      facing = Direction.Right;
    }
  }
}
