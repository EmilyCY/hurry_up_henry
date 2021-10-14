import 'package:flutter/material.dart';
import 'package:hurry_up_henry/Constants/constants.dart';
import 'package:hurry_up_henry/Models/car_status.dart';
import 'package:hurry_up_henry/Services/api_manager.dart';
import 'package:provider/provider.dart';
import 'package:hurry_up_henry/Providers/controller.dart';
import '../Providers/controller.dart';
import 'dart:math';

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
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
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Constants.gridBackground), fit: BoxFit.cover),
        ),
        child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: sqrt(Constants.gridNum).toInt(), // put to constant
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
                              return Image.asset(
                                Constants.henry,
                                fit: BoxFit.contain,
                              );
                            } else {
                              return Image.asset(
                                Constants.redCar,
                                fit: BoxFit.contain,
                              );
                            }
                          } else {
                            print(snapshot.error);
                            return Image.asset(
                              Constants.redCar,
                              fit: BoxFit.contain,
                            );
                          }
                        },
                      ))
                    : index == context.watch<Controller>().goalPosition
                        ? (Image.asset(
                            Constants.goal,
                            fit: BoxFit.contain,
                          ))
                        : Constants.checkObstacleExists(
                                index, Constants.obstacles)
                            ? (Image.asset(
                                Constants.obstalceImage,
                                fit: BoxFit.contain,
                              ))
                            : null,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.grey.shade800,
                  width: 2,
                )),
              );
            })),
      ),
    );
  }
}
