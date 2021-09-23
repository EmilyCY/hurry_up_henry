import 'package:flutter/material.dart';
import 'package:hurry_up_henry/Models/car_status.dart';
import 'package:hurry_up_henry/Services/api_manager.dart';
import 'package:hurry_up_henry/main.dart';
import 'package:provider/provider.dart';
import 'package:hurry_up_henry/Providers/controller.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  Color _car_color = Colors.red;

  @override
  void initState() {
    String carStatus = APIManager().getCarStatus();
    if (carStatus == "ready") {
      _car_color = Colors.red;
    } else {
      _car_color = Colors.green;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 10,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            children: List.generate(GRID_NUM, (index) {
              return Container(
                child: index == context.watch<Controller>().currentPosition
                    ? (Icon(
                        Icons.face_outlined,
                        size: 40,
                        color: _car_color,
                      )
                        //print("in return container");
                        )
                    : null,
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