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

enum ActionType { Delete, Run, CarSwitch, Up, Down, Left, Right }

class Controller with ChangeNotifier {
  int currentPosition = 0;
  int goalPosition = 0;
  static Random randomNum = new Random();
  int startPosition = 0;
  List<Move> moves = [];

  Controller() {
    currentPosition = randomNum.nextInt(99);
    newGame();
  }

  void getCurrentPosition() async {
    for (Move move in moves) {
      await Future.delayed(Duration(milliseconds: 500));

      if (!isOutOfBounds(currentPosition, move.direction)) {
        currentPosition += move.positionChange;
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
  }

  void newGame() {
    newGoal();
    moves = [];
  }

  void newGoal() {
    goalPosition = randomNum.nextInt(99);
  }

  void makeMove(ActionType action) {
    Move move = new Move(action);
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
    newGame();
  }

  void lose() {
    player.play(loseSFXpath);
    print("lose");
    moves = [];
    notifyListeners();
  }

  bool isOutOfBounds(int currentPosition, ActionType direction) {
    switch (direction) {
      case ActionType.Left:
        {
          if (currentPosition % sqrt(GRID_NUM) != 0) {
            return false;
          }
        }
        break;
      case ActionType.Right:
        {
          if (currentPosition % sqrt(GRID_NUM) != sqrt(GRID_NUM) - 1) {
            return false;
          }
        }
        break;
      case ActionType.Up:
        {
          if (currentPosition - sqrt(GRID_NUM) >= 0) {
            return false;
          }
        }
        break;
      case ActionType.Down:
        {
          if (currentPosition + sqrt(GRID_NUM) <= GRID_NUM) {
            return false;
          }
        }
        break;
    }
    return true;
  }
}
