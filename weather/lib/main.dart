import 'package:flutter/material.dart';
import 'Report.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText1: TextStyle(fontSize: 20, color: Colors.white),
              headline1: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              caption: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.yellow,
              ))),
      home: Scaffold(
        body: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/cloud.gif'), fit: BoxFit.cover)),
            child: const Report()),
      ),
    );
  }
}
