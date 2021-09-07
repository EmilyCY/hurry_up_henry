import 'package:equatable/equatable.dart';

class Item extends Equatable {

  const Item({
    required  this.row,
    required  this.col,
    this.isMoving = false,
  });

  final int row;
  final int col;
  final bool isMoving;

  Item copyWith({int? row, int? col, bool? isMoving=false}) {
    return Item(
      row: row ?? this.row,
      col: col ?? this.col,
      isMoving: isMoving ?? this.isMoving,
    );
  }

  @override
  List<Object> get props => [row, col, isMoving];
}
