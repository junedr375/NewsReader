import 'package:flutter/material.dart';
import 'package:triveous/Home/Home.dart';



//5ec5ff9761014d9eafbb60fd9167583e  API Key


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}