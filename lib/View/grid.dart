import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 10,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            children: List.generate(100, (index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white38,
                    //image: DecorationImage(
                    //image: AssetImage('assets/car.jpg'),
                    //fit: BoxFit.fitHeight,
                    //),
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
