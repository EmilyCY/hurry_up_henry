import 'package:flutter/material.dart';
import 'package:hurry_up_henry/Providers/controller.dart';
import 'circle_button.dart';
import 'console.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

enum ButtonType {
  Up,
  Left,
  Run,
  Right,
  Down,
  Delete,
  CarSwitch
}
class ButtonOffsets {
  static int getValue(ButtonType button) {
    switch (button) {
      case ButtonType.Up:   return 1;
      case ButtonType.Left: return 4;
      case ButtonType.Run:  return 3;
      case ButtonType.Right: return 6;
      case ButtonType.Down: return 9;
      case ButtonType.Delete: return 7;
      case ButtonType.CarSwitch: return 11;
    }
  }
}

class _ControlPanelState extends State<ControlPanel> {
  final double _iconSize = 50;
  final int GRID_SIZE = 12;

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
                if (index == ButtonOffsets.getValue(ButtonType.Up)) {
                  return CircleButton(
                    color: Colors.blue,
                    icon: Icons.arrow_upward_rounded,
                    action: ActionType.Up,
                  );
                } else if (index == ButtonOffsets.getValue(ButtonType.Left)) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_back_rounded,
                      action: ActionType.Left);
                } else if (index == ButtonOffsets.getValue(ButtonType.Run)) {
                  return CircleButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.play_circle_fill,
                      action: ActionType.Run);
                } else if (index == ButtonOffsets.getValue(ButtonType.Right)) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_forward_rounded,
                      action: ActionType.Right);
                } else if (index == ButtonOffsets.getValue(ButtonType.Down)) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_downward_rounded,
                      action: ActionType.Down);
                } else if (index == ButtonOffsets.getValue(ButtonType.Delete)) {
                  return CircleButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.close_rounded,
                      action: ActionType.Delete);
                } else if (index == ButtonOffsets.getValue(ButtonType.CarSwitch)) {
                  return CircleButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.car_rental_rounded,
                      action: ActionType.CarSwitch);
                } else {
                  return Container();
                }
              })),
        ),
      ],
    );
  }
}
