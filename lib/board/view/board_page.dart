import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hurry_up_henry/board/board.dart';
import 'package:hurry_up_henry/repository.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Complex List')),
      body: BlocProvider(
        create: (_) => BoardCubit(
          repository: context.read<Repository>(),
        )..createBoard(),
        child: BoardView(),
      )
    );
  }
}


class BoardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<BoardCubit>().state;
    switch (state.status) {
      case ListStatus.failure:
        return const Center(child: Text('Oops something went wrong!'));
      case ListStatus.success:
        return ItemView(items: state.items);
      default:
        return const Center(child: CircularProgressIndicator());
    }
  }
}

class ItemView extends StatelessWidget {
  const ItemView({Key? key, required this.items}) : super(key: key);

  final List<List<Item>> items;

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? const Center(child: Text('no content'))
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              int x, y = 0;
              x = (index / items.length).floor();
              y = (index % items.length);

              return ItemTile(
                item: items[x][y],
                onDeletePressed: (id) {
                  context.read<BoardCubit>().deleteItem(id);
                },
              );
            },
            itemCount: items.length,
          );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.item,
    required this.onDeletePressed,
  }) : super(key: key);

  final Item item;
  final ValueSetter<String> onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        /*leading: Text('#${item.id}'),*/
        title: Text(item.row.toString()),
/*        trailing: item.isDeleting
            ? const CircularProgressIndicator()
            : IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onDeletePressed(item.id),
              ),*/
      ),
    );
  }
}

/*
class BoardView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          /*testList.removeLast();*/ })
      ),
      body: _buildGameBody()
    );
  }

  Widget _buildGameBody() {
    return Column(
      children: < Widget > [
        AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0)
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: _buildGridItems,
                  itemCount: 4 * 4,
                ),
          ),
        ),
      ]);
  }

  Widget _buildGridItems(BuildContext context, int index) {
    int gridStateLength = GRID_SIZE;
    int x, y = 0;
    x = (index / gridStateLength).floor();
    y = (index % gridStateLength);
    return  GridTile(
        child: _buildGridItem(x, y)
      );
  }

  Widget _buildGridItem(int x, int y) {
    return Container(
          decoration: BoxDecoration(
            color: this.gridState[x][y].isBusy?Colors.amber:Colors.red,
            border: Border.all(color: Colors.black, width: 0.5)
          ),
          child: Center(
            child: Text(this.gridState[x][y].row.toString()+","+this.gridState[x][y].col.toString()),
          ),
        );
  }
}
*/