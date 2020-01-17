import 'package:clock/clock/colok_ui.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Clock.tag: (context) => Clock(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Clock(),
      routes: routes,
    );
  }
}
