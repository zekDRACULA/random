import 'package:flutter/material.dart';
import 'package:random/screens/Dashboard.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const Dashboard(),
    );
  }
}





//
void main() {
  runApp(const MyApp());
}
