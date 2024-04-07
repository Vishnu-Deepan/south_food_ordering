import 'package:donut_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zomato',
      home: HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    );
  }
}
