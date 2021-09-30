import 'package:flutter/material.dart';
import 'package:hurry_up_henry/Constants/constants.dart';
import 'package:hurry_up_henry/Models/car_status.dart';
import 'package:hurry_up_henry/Services/api_manager.dart';
import 'package:provider/provider.dart';
import 'package:hurry_up_henry/Providers/controller.dart';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  //Color _car_color = Colors.red;
  late Future<CarStatus> futureCarStatus;

  @override
  void initState() {
    super.initState();
    print("status begin");
    futureCarStatus = APIManager.getCarStatus();
    print("car status end");
  }

  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 10, // put to constant
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            children: List.generate(Constants.gridNum, (index) {
              return Container(
                child: index == context.watch<Controller>().currentPosition
                    ? (FutureBuilder<CarStatus>(
                        future: futureCarStatus,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.status == "READY") {
                              return Icon(
                                Icons.face_outlined,
                                size: 40,
                                color: Colors.green,
                              );
                            } else {
                              return Icon(
                                Icons.face_outlined,
                                size: 40,
                                color: Colors.red,
                              );
                            }
                          } else {
                            print(snapshot.error);
                            return Icon(
                              Icons.face_outlined,
                              size: 40,
                              color: Colors.red,
                            );
                          }
                        },
                      ))
                    : index == context.watch<Controller>().goalPosition
                        ? (Icon(
                            Icons.star,
                            size: 40, //needs scaling?
                            color: Colors.yellow[600],
                          ))
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
