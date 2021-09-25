import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hurry_up_henry/Providers/controller.dart';
import 'package:hurry_up_henry/main.dart';

class Move {
  IconData icon = Icons.error;
  late ActionType direction;
  int positionChange = 0;

  Move(ActionType action) {
    this.direction = action;

    switch (this.direction) {
      case ActionType.Left:
        {
          this.positionChange = -1;
          this.icon = Icons.arrow_back_rounded;
        }
        break;

      case ActionType.Right:
        {
          this.positionChange = 1;
          this.icon = Icons.arrow_forward_rounded;
        }
        break;

      case ActionType.Up:
        {
          this.positionChange = -sqrt(GRID_NUM).toInt();
          this.icon = Icons.arrow_upward_rounded;
        }
        break;

      case ActionType.Down:
        {
          this.positionChange = sqrt(GRID_NUM).toInt();
          this.icon = Icons.arrow_downward_rounded;
        }
        break;
    }
  }

}
