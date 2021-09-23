import 'package:flutter/material.dart';
import 'circle_button.dart';
import 'console.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

enum Button {
  Up,
  Left,
  Run,
  Right,
  Down,
  Delete,
  CarSwitch
}

class ButtonOffsets {
  static int getValue(Button button) {
    switch (button) {
      case Button.Up:   return 1;
      case Button.Left: return 4;
      case Button.Run:  return 3;
      case Button.Right: return 6;
      case Button.Down: return 9;
      case Button.Delete: return 7;
      case Button.CarSwitch: return 11;
    }
  }
}

class _ControlPanelState extends State<ControlPanel> {
  final double _iconSize = 50;
  final GRID_SIZE = 12;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Console(iconSize: _iconSize)),
        Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              children: List.generate(GRID_SIZE, (index) {
                if (index == ButtonOffsets.getValue(Button.Up)) {
                  return CircleButton(
                    color: Colors.blue,
                    icon: Icons.arrow_upward_rounded,
                    action: "up",
                  );
                } else if (index == ButtonOffsets.getValue(Button.Left)) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_back_rounded,
                      action: "left");
                } else if (index == ButtonOffsets.getValue(Button.Run)) {
                  return CircleButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.play_circle_fill,
                      action: "run");
                } else if (index == ButtonOffsets.getValue(Button.Right)) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_forward_rounded,
                      action: "right");
                } else if (index == ButtonOffsets.getValue(Button.Down)) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_downward_rounded,
                      action: "down");
                } else if (index == ButtonOffsets.getValue(Button.Delete)) {
                  return CircleButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.close_rounded,
                      action: "delete");
                } else if (index == ButtonOffsets.getValue(Button.CarSwitch)) {
                  return CircleButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.car_rental_rounded,
                      action: "carSwitch");
                } else {
                  return Container();
                }
              })),
        ),
      ],
    );
  }
}
