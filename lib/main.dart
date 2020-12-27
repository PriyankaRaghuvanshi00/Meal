import 'package:flutter/material.dart';
import 'package:meal/app.dart';
import 'categorygrid.dart';
import 'categorydata.dart';
import 'filter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => AppB(),
      },
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.purple,
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}
