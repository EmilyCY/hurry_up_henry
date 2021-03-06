import 'package:flutter/material.dart';
import 'package:hurry_up_henry/Constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:hurry_up_henry/Providers/controller.dart';

class Console extends StatefulWidget {
  const Console({
    Key? key,
    required double iconSize,
  })  : _iconSize = iconSize,
        super(key: key);

  final double _iconSize;

  @override
  State<Console> createState() => _ConsoleState();
}

class _ConsoleState extends State<Console> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Constants.consoleFrame), fit: BoxFit.fill),
      ),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 6,
          children:
              List.generate(context.watch<Controller>().moves.length, (index) {
            return Icon(
              context.watch<Controller>().moves[index].icon,
              size: widget._iconSize,
            );
          })),
    );
  }
}
