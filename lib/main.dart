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
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 5)),
        builder: (c, s) {
          if (s.connectionState == ConnectionState.waiting)
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          else
            return GymHomeView();
        },
      ),
      routes: routesMap(),
    );
  }
}
