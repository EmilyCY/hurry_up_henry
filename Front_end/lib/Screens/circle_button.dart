import 'package:flutter/material.dart';
import 'package:hurry_up_henry/Providers/controller.dart';
import 'package:provider/provider.dart';

class CircleButton extends StatelessWidget {
  final Color color;
  final double iconSize;
  final IconData icon;
  final String action;

  const CircleButton({
    Key? key,
    required this.color,
    this.iconSize = 50,
    required this.icon,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          if (action == "delete") {
            context.read<Controller>().deleteMove();
          } else if (action == "run") {
            context.read<Controller>().getCurrentPosition();
          } else if (action == "carSwitch") {
            // placeholder for API
            print(" car switch is on");
          } else {
            context.read<Controller>().makeMove(action);
          }
        },
        child: Icon(this.icon, size: this.iconSize),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          primary: this.color, // Button color
          onPrimary: Colors.black,
        ),
      ),
    );
  }
}
