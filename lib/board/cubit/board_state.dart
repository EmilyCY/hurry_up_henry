part of 'board_cubit.dart';

enum ListStatus { loading, success, failure }

class BoardState extends Equatable {
  const BoardState._({
    this.status = ListStatus.loading,
    this.items = const <List<Item>>[]
  });

  const BoardState.loading() : this._();

  const BoardState.success(List<List<Item>> items)
      : this._(status: ListStatus.success, items: items);

  const BoardState.failure() : this._(status: ListStatus.failure);

  final ListStatus status;
  final List<List<Item>> items;

  @override
  List<Object> get props => [status, items];
}
