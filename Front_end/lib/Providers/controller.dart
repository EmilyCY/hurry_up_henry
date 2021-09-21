import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import '../main.dart';
import 'move.dart';

class Controller with ChangeNotifier {
  int currentPosition = 0;
  static Random randomNum = new Random();
  int startPosition = 0;
  List<Move> moves = [];
  List<int> leftBoundary = [];
  List<int> rightBoundary = [];
  List<int> upperBoundary = [];
  List<int> lowerBoundary = [];

  void getCurrentPosition() async {
    for (Move move in moves) {
      await Future.delayed(Duration(milliseconds: 500));
      this.currentPosition += move.positionChange;
      notifyListeners();
      print(currentPosition);
    }
    this.moves = [];
  }

  void deleteMove() {
    moves.removeLast();
    notifyListeners();
  }

  void reStart() {
    this.startPosition = randomNum.nextInt(99);
    this.currentPosition = this.startPosition;
    this.moves = [];
  }

  void makeMove(String direction) {
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
