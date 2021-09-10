import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key, 
    required this.color, 
    this.iconSize = 50,
    required this.icon,
    }) : super(key: key);

  final Color color;
  final double iconSize;
  final IconData icon ;
  

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                          icon,
                          size: iconSize),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: color, // Button color
                        onPrimary: Colors.black,
                      ),
                    ),
    );
  }
}
