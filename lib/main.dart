import 'package:flutter/material.dart';
import 'lib.dart';

void main() => runApp(H2OApp());

class H2OApp extends StatelessWidget {
  @override
  Widget build(_) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: gymAppTitle4Recents,
      theme: themeData(),
      home: GymHomeView(),
      routes: routesMap(),
    );
  }
}
