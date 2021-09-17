import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '../main.dart';
import 'move.dart';
import 'package:audioplayers/audioplayers.dart';

//todo: move elsewhere
AudioPlayer player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
final winSFXpath = "assets/win.wav";
final loseSFXpath = "assets/lose.wav";
final moveSFXpath = "assets/move.wav";

class Controller with ChangeNotifier {
  int currentPosition = 0;
  int goalPosition = 0;
  static Random randomNum = new Random();
  int startPosition = 0;
  List<Move> moves = [];
  List<int> leftBoundary = [];
  List<int> rightBoundary = [];
  List<int> upperBoundary = [];
  List<int> lowerBoundary = [];

  Controller() {
    //this.startPosition = randomNum.nextInt(99);
    //this.currentPosition = this.startPosition;
    currentPosition = randomNum.nextInt(99);
    newGame();
    this.leftBoundary = getLeftBoundary();
    this.upperBoundary = getUpperBoundary();
    this.rightBoundary = getRightBoundary();
    this.lowerBoundary = getLowerBoundary();
  }

  void getCurrentPosition() async {
    for (Move move in moves) {
      await Future.delayed(Duration(milliseconds: 500));

      if (!isOutOfBounds(this.currentPosition, move.direction)) {
        this.currentPosition += move.positionChange;
        player.play(moveSFXpath);
      } else {
        lose();
        break;
      }

      notifyListeners();
      print(currentPosition);
    }
    this.moves = [];
    winCondition();
    //fail state?
  }

  void winCondition() {
    currentPosition == goalPosition ? win() : lose();
  }

  void win() {
    player.play(winSFXpath);
    newGame();
  }

  void lose() {
    player.play(loseSFXpath);
    print("lose");
    moves = [];
    notifyListeners();
  }

  void run() {}

  void newGoal() {
    // generate random goal pos that is at least 2 sq away from current pos
    goalPosition = randomNum.nextInt(99);
    //List<int> noGoalZone = [];
  }

  void newGame() {
    newGoal();
    moves = [];
  }

  void makeMove(String direction) {
    /*
    List<int> boundary = [];

    switch (direction) {
      case "left":
        {
          boundary = this.leftBoundary;
        }
        break;
      case "right":
        {
          boundary = this.rightBoundary;
        }
        break;
      case "up":
        {
          boundary = this.upperBoundary;
        }
        break;
      case "down":
        {
          boundary = this.lowerBoundary;
        }
        break;
    }
    if (boundary.every((n) => n != this.currentPosition)) {
      Move move = new Move(direction);
      this.moves.add(move);
      notifyListeners();
    }
    */
    Move move = new Move(direction);
    this.moves.add(move);
    notifyListeners();
  }

  List<int> getLeftBoundary() {
    for (int i = 0; i < sqrt(GRID_NUM); i++) {
      this.leftBoundary.add(sqrt(GRID_NUM).toInt() * i);
    }
    return this.leftBoundary;
  }

  List<int> getRightBoundary() {
    for (int i = 0; i < sqrt(GRID_NUM); i++) {
      this.rightBoundary.add(sqrt(GRID_NUM).toInt() * (i + 1) - 1);
    }
    return this.leftBoundary;
  }

  List<int> getUpperBoundary() {
    for (int i = 0; i < sqrt(GRID_NUM) - 1; i++) {
      this.upperBoundary.add(i);
    }
    return this.upperBoundary;
  }

  List<int> getLowerBoundary() {
    for (int i = 0; i < sqrt(GRID_NUM) - 1; i++) {
      this.lowerBoundary.add(GRID_NUM - 1 - i);
    }
    return this.lowerBoundary;
  }
}

bool isOutOfBounds(int currentPosition, String direction) {
  switch (direction) {
    case "left":
      {
        if (currentPosition % sqrt(GRID_NUM) != 0) {
          return false;
        }
      }
      break;
    case "right":
      {
        if (currentPosition % sqrt(GRID_NUM) != sqrt(GRID_NUM) - 1) {
          return false;
        }
      }
      break;
    case "up":
      {
        if (currentPosition - sqrt(GRID_NUM) >= 0) {
          return false;
        }
      }
      break;
    case "down":
      {
        if (currentPosition + sqrt(GRID_NUM) <= GRID_NUM) {
          return false;
        }
      }
      break;
  }
  return true;
}
