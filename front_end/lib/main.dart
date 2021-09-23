import 'Providers/controller.dart';
import 'Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const GRID_NUM = 100;
//Controller controller = new Controller();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
