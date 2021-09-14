import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hurry_up_henry/main.dart';

class Move {
  IconData icon = Icons.error;
  String direction = "";
  int positionChange = 0;

  Move(String direction) {
    this.direction = direction;
    switch (this.direction) {
      case "left":
        {
          this.positionChange = -1;
          this.icon = Icons.arrow_back_rounded;
        }
        break;

      case "right":
        {
          this.positionChange = 1;
          this.icon = Icons.arrow_forward_rounded;
        }
        break;

      case "up":
        {
          this.positionChange = -sqrt(GRID_NUM).toInt();
          this.icon = Icons.arrow_upward_rounded;
        }
        break;

      case "down":
        {
          this.positionChange = sqrt(GRID_NUM).toInt();
          this.icon = Icons.arrow_downward_rounded;
        }
        break;
    }
  }

}
