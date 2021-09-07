import 'dart:async';
import 'dart:math';

import 'package:hurry_up_henry/board/board.dart';

class Repository {
  final _random = Random();

  int _randomRange(int min, int max) => min + _random.nextInt(max - min);

  Future < List < List < Item >>> createItems() async {
    await Future < void > .delayed(Duration(seconds: _randomRange(1, 5)));

    //generate a 8x8 grid
    return _generateGrid(8);
  }

  List < List < Item >> _generateGrid(int dimension) {
    List < List < Item >> gridState = [];


    gridState = new List.generate(dimension, (i) =>
      new List.generate(dimension, (j) => new Item(row: i, col: j)));

    //    gridState[0][0].isMoving = true;
    print("GENERATE GRID!");
    return gridState;
  }

  Future < void > deleteItem(String id) async {
    await Future < void > .delayed(Duration(seconds: _randomRange(1, 5)));
  }
}