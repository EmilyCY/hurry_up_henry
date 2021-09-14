import 'package:flutter/material.dart';
import 'grid.dart';
import 'controlpanel.dart';

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
        children: [Grid(), Expanded(child: ControlPanel())],
      ),
    );
  }

  @override
  void initState() { 
    super.initState();
    
  }
}

