import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hurry_up_henry/repository.dart';

import '../models/models.dart';

part 'board_state.dart';

enum MoveDirection {
  Left,
  Right,
  Up,
  Down
}
class BoardCubit extends Cubit < BoardState > {
  BoardCubit({
    required this.repository
  }): super(const BoardState.loading());

  final Repository repository;

  Future < void > createBoard() async {
    try {
      final items = await repository.createItems();
      emit(BoardState.success(items));
    }
    on Exception {
      //this is where we will emit failure to connet to the car
      emit(const BoardState.failure());
    }
  }

  Future < void > moveItem() async {
      await moveCar(1, 1, MoveDirection.Right);
      await moveCar(2, 1, MoveDirection.Right);
      await moveCar(3, 1, MoveDirection.Right);
      await moveCar(4, 1, MoveDirection.Right);
      await moveCar(5, 1, MoveDirection.Right);
      await moveCar(5, 1, MoveDirection.Left);
      await moveCar(4, 1, MoveDirection.Left);
      await moveCar(3, 1, MoveDirection.Left);
      await moveCar(2, 1, MoveDirection.Left);
      await moveCar(1, 1, MoveDirection.Left);

  }

  Future < void > moveCar(int col, int row, MoveDirection direction) async {

    switch (direction) {
      case (MoveDirection.Right):
        final newItems = state.items.map((item) {
          if (item.col == col && item.row == row) 
            return item.copyWith(isMoving: true);
          else if (item.col == (col-1) && item.row == row)
            return item.copyWith(isMoving: false);
          else return item;
        }).toList();
        emit(BoardState.success(newItems));
        await Future < void > .delayed(Duration(seconds: 1));
        break;
      case (MoveDirection.Left):
              final newItems = state.items.map((item) {
          if (item.col == col && item.row == row) 
            return item.copyWith(isMoving: true);
          else if (item.col == (col+1) && item.row == row)
            return item.copyWith(isMoving: false);
          else return item;
        }).toList();
        emit(BoardState.success(newItems));
        await Future < void > .delayed(Duration(seconds: 1));
        break;
      case (MoveDirection.Up):
        break;
      case (MoveDirection.Down):
        break;

    }

    /*unawaited(repository.deleteItem(id).then((_) {
      final deleteSuccess = List.of(state.items)
        ..removeWhere((element) => element.id == id);
      emit(BoardState.success(deleteSuccess));
    }));*/
  }
}
