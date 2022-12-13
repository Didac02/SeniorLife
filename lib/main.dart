import 'package:flutter/material.dart';
import 'package:seriorlife/home.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const Scaffold(
        backgroundColor:  Color.fromARGB(255, 240, 240, 240),
        body:  SafeArea(
          child: Home() 
        ),
      ),
    );
  }
}
