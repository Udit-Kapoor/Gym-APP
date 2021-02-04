import 'package:flutter/material.dart';
import 'lib.dart';

void main() => runApp(H2OApp());

class H2OApp extends StatelessWidget {
  @override
  Widget build(_) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: Routes().routes,
    );
  }
}
