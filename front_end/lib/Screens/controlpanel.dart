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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Console(iconSize: Constants.consoleIconSize)),
        Container(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            color: Constants.consoleColor,
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                children: List.generate(Constants.controlGridNumber, (index) {
                  if (index == ActionType.MoveUp.buttonIndex) {
                    return CircleButton(
                      image: Constants.upButton,
                      action: ActionType.MoveUp,
                    );
                  } else if (index == ActionType.MoveLeft.buttonIndex) {
                    return CircleButton(
                        image: Constants.leftButton,
                        action: ActionType.MoveLeft);
                  } else if (index == ActionType.Run.buttonIndex) {
                    return CircleButton(
                        image: Constants.runButton, action: ActionType.Run);
                  } else if (index == ActionType.MoveRight.buttonIndex) {
                    return CircleButton(
                        image: Constants.rightButton,
                        action: ActionType.MoveRight);
                  } else if (index == ActionType.MoveDown.buttonIndex) {
                    return CircleButton(
                        image: Constants.downButton,
                        action: ActionType.MoveDown);
                  } else if (index == ActionType.Delete.buttonIndex) {
                    return CircleButton(
                        image: Constants.deleteButton,
                        action: ActionType.Delete);
                  } else if (index == ActionType.Restart.buttonIndex) {
                    return CircleButton(
                        image: Constants.restartButton,
                        action: ActionType.Restart);
                  } else {
                    return Container();
                  }
                })),
          ),
        ),
      ],
    );
  }
}
