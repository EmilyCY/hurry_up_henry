import 'package:hurry_up_henry/Constants/constants.dart';
import 'dart:math';

class Obstacle {
  int position = 0;

  void setRandomPosition() {
    Random randomNum = new Random();
    this.position = randomNum.nextInt(Constants.gridNum - 1);
  }

  int getPosition() {
    return this.position;
  }
}
