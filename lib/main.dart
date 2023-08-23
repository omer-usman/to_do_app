import 'package:flutter/material.dart';
import '/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner:
          false, // TRY THIS: Set to true and see what happens in the AppBar.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
