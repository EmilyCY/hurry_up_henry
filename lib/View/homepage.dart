import 'package:flutter/material.dart';
import 'grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hurry Up Henry"),
      ),
      body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1/1,
                child: Container(
                  child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 10,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      children: List.generate(100, (index){
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              //image: DecorationImage(
                              //image: AssetImage('assets/car.jpg'),
                              //fit: BoxFit.fitHeight,
                              //),
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              )
                          ),
                        );
                      })
                  ),
                ),
              ),

              Expanded(
                child: Container(
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded (
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_upward),
                            label: Text('Up'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                                primary: Colors.black,
                                //padding: EdgeInsets.symmetric(vertical: 100),
                                textStyle: TextStyle(fontSize: 30)
                            ),
                          ),
                        ),
                        Expanded  (
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_downward),
                            label: Text('Down'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                primary: Colors.black,
                                //padding: EdgeInsets.symmetric(vertical: 100),
                                textStyle: TextStyle(fontSize: 30)
                            ),
                          ),
                        ),
                        Expanded  (
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back),
                            label: Text('Left'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                primary: Colors.black,
                                //padding: EdgeInsets.symmetric(horizontal: 100),
                                textStyle: TextStyle(fontSize: 30)
                            ),
                          ),
                        ),
                        Expanded (
                          child: TextButton.icon(
                            onPressed: () {
                              // 1. move
                              // 2. send data to server
                            },
                            icon: Icon(Icons.arrow_forward),
                            label: Text('Right'),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.green,
                                primary: Colors.black,
                                //padding: EdgeInsets.symmetric(horizontal: 100),
                                textStyle: TextStyle(fontSize: 30)
                            ),
                          ),
                        )
                      ],
                    )
                ),
              )


            ],

          ),
    );
  }




  }

