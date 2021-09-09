import 'package:flutter/material.dart';

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
        Container(
          padding: EdgeInsets.all(20.0),
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 5,
              children: List.generate(9, (index) {
                if (index == 1) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                          Icons.arrow_upward_rounded,
                          size: 40),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.blue, // <-- Button color
                        onPrimary: Colors.black,
                      ),
                    ),
                  );
                }
                else if (index == 3) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.arrow_back_rounded, size:_iconSize),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.blue, // <-- Button color
                        onPrimary: Colors.black,
                      ),
                    ),
                  );
                }
                else if (index == 4) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.play_circle_fill, size:_iconSize),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.deepOrangeAccent, // <-- Button color
                        onPrimary: Colors.black,
                      ),
                    ),
                  );
                }
                else if (index == 5) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.arrow_forward_rounded, size:_iconSize),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.blue, // <-- Button color
                        onPrimary: Colors.black,
                      ),
                    ),
                  );
                }
                else if (index == 7) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.arrow_downward_rounded, size:_iconSize),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        primary: Colors.blue, // <-- Button color
                        onPrimary: Colors.black,
                      ),
                    ),
                  );
                }
                else {
                  return Container();
                }

              })),
        ),
        Expanded(
          child: Container(
            color: Colors.lightGreen[100],
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_rounded,
                    size: _iconSize,
                  ),
                  Icon(
                    Icons.arrow_downward_rounded,
                    size: _iconSize,
                  ),
                  Icon(
                    Icons.arrow_back_rounded,
                    size: _iconSize,
                  ),
                  Icon(
                    Icons.arrow_back_rounded,
                    size: _iconSize,
                  ),
                  Icon(
                    Icons.arrow_back_rounded,
                    size: _iconSize,
                  ),
                  Icon(
                    Icons.arrow_back_rounded,
                    size: _iconSize,
                  ),
                  Icon(
                    Icons.arrow_back_rounded,
                    size: _iconSize,
                  ),
                  Icon(
                    Icons.arrow_downward_rounded,
                    size: _iconSize,
                  ),
                  Icon(
                    Icons.arrow_downward_rounded,
                    size: _iconSize,
                  ),
                ],
            ),
          )

        )
      ],
    );
  }
}
