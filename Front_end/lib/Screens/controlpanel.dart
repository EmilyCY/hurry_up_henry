import 'package:flutter/material.dart';
import 'circle_button.dart';
import 'console.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  final double _iconSize = 50;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Console(iconSize: _iconSize)),
        Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 50,
              children: List.generate(9, (index) {
                if (index == 1) {
                  return CircleButton(
                    color: Colors.blue,
                    icon: Icons.arrow_upward_rounded,
                    action: "up",
                  );
                } else if (index == 3) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_back_rounded,
                      action: "left");
                } else if (index == 4) {
                  return CircleButton(
                      color: Colors.deepOrangeAccent,
                      icon: Icons.play_circle_fill,
                      action: "run");
                } else if (index == 5) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_forward_rounded,
                      action: "right");
                } else if (index == 7) {
                  return CircleButton(
                      color: Colors.blue,
                      icon: Icons.arrow_downward_rounded,
                      action: "down");
                } else {
                  return Container();
                }
              })),
        ),
      ],
    );
  }
}




