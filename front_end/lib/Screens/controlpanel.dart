import 'package:flutter/material.dart';
import 'package:hurry_up_henry/Constants/constants.dart';
import 'circle_button.dart';
import 'console.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class ButtonOffsets {}

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
                if (index == ActionType.MoveUp.buttonIndex) {
                  return CircleButton(
                    color: Colors.blue,
                    icon: Icons.arrow_upward_rounded,
                    action: ActionType.MoveUp,
                  );
                } else if (index == ActionType.MoveLeft.buttonIndex) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_back_rounded,
                      action: ActionType.MoveLeft);
                } else if (index == ActionType.Run.buttonIndex) {
                  return CircleButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.play_circle_fill,
                      action: ActionType.Run);
                } else if (index == ActionType.MoveRight.buttonIndex) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_forward_rounded,
                      action: ActionType.MoveRight);
                } else if (index == ActionType.MoveDown.buttonIndex) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_downward_rounded,
                      action: ActionType.MoveDown);
                } else if (index == ActionType.Delete.buttonIndex) {
                  return CircleButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.close_rounded,
                      action: ActionType.Delete);
                } else if (index == ActionType.CarSwitch.buttonIndex) {
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
