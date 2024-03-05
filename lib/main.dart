import 'package:apihit/provider.dart';
import 'package:apihit/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('User Details'),
          ),
          body: SecondScreen(),
        ),
      ),
    );
  }
}
