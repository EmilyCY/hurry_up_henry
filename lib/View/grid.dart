import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  int totalGrid = 100;
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 10,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            children: List.generate(totalGrid, (index) {
              return Container(
                child: Icon(
                  Icons.face_outlined,
                  size: 40,
                  color: Colors.green[600],
                ),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    )),
              );
            })),
      ),
    );
  }
}
