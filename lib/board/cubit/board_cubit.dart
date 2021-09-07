import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hurry_up_henry/repository.dart';

import '../models/models.dart';

part 'board_state.dart';

class BoardCubit extends Cubit<BoardState> {
  BoardCubit({required this.repository})
      : super(const BoardState.loading());

  final Repository repository;

  Future<void> createBoard() async {
    try {
      final items = await repository.createItems();
      emit(BoardState.success(items));
    } on Exception {
      emit(const BoardState.failure());
    }
  }

  Future<void> deleteItem(String id) async {
 /*
    final deleteInProgress = state.items.map((item) {
      return item.col == col ? item.copyWith(isMoving: true) : item;
    }).toList();

    emit(BoardState.success(deleteInProgress));

    /*unawaited(repository.deleteItem(id).then((_) {
      final deleteSuccess = List.of(state.items)
        ..removeWhere((element) => element.id == id);
      emit(BoardState.success(deleteSuccess));
    }));*/
  }
  */
}
}
