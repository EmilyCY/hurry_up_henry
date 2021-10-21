import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hurry_up_henry/Constants/constants.dart';

class Move {
  late Image image;
  late IconData icon;
  late Direction direction;
  int positionChange = 0;

  Move(Direction direction) {
    this.direction = direction;

    switch (direction) {
      case Direction.Left:
        {
          this.positionChange = -1;
          this.image = Image.asset('assets/images/arrowLeft');
          this.icon = Icons.arrow_back_rounded;
        }
        break;

      case Direction.Right:
        {
          this.positionChange = 1;
          this.image = Image.asset('assets/images/arrowRight');
          this.icon = Icons.arrow_forward_rounded;
        }
        break;

      case Direction.Up:
        {
          this.positionChange = -sqrt(Constants.gridNum).toInt();
          this.image = Image.asset('images/arrowUp');
          this.icon = Icons.arrow_upward_rounded;
        }
        break;

      case Direction.Down:
        {
          this.positionChange = sqrt(Constants.gridNum).toInt();
          this.image = Image.asset('images/arrowDown');
          this.icon = Icons.arrow_downward_rounded;
        }
        break;
    }
  }
}
