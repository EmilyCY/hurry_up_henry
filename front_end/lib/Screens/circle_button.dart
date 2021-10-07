import 'package:flutter/material.dart';
import 'package:hurry_up_henry/Constants/constants.dart';
import 'package:hurry_up_henry/Providers/controller.dart';
import 'package:provider/provider.dart';

class CircleButton extends StatelessWidget {
  final String image;
  final ActionType action;

  const CircleButton({
    Key? key,
    required this.image,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      child: MaterialButton(
          onPressed: () {
            if (action == ActionType.Delete) {
              context.read<Controller>().deleteMove();
            } else if (action == ActionType.Run) {
              context.read<Controller>().getCurrentPosition();
            } else if (action == ActionType.Restart) {
              context.read<Controller>().newGame();
            } else {
              context.read<Controller>().makeMove(action);
            }
          },
          child: Container(
              decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(this.image), fit: BoxFit.contain),
          ))),
    );
  }
}
