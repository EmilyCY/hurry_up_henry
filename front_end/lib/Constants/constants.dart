import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// seperate enum for action types and directions to avoid confusion
enum ActionType {
  Delete,
  Run,
  CarSwitch,
  MoveUp,
  MoveDown,
  MoveLeft,
  MoveRight
}
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
      case ActionType.CarSwitch:
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
      case ActionType.CarSwitch:
        break;
    }
  }
}

//sound effects
AudioPlayer player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
final winSFXpath = "assets/win.wav";
final loseSFXpath = "assets/lose.wav";
final moveSFXpath = "assets/move.wav";

// setting as abstract class to prevent from instantiation
abstract class Constants {
  // http constants
  static const url = '127.0.0.1:8088';
  //static const unencodedPath = '/ui/';
  static const statusPath = '/ui/';
  static const drivePath = '/ui/';
  static const apikey = 'special-key';

  // screen constants
  static const gridNum = 100;
  static const buttonIconSize = 50;
  static const Color directionButtonColor = Colors.blue;
}