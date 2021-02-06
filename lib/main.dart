import 'package:flutter/material.dart';

import 'views/trainer/clients_details_view.dart';

void main() {
  runApp(H2OApp());
}

class H2OApp extends StatelessWidget {
  @override
  Widget build(_) {
    return MaterialApp(
      title: 'H2O',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/ClientsDetailsView': (c) => ClientsDetailsView(),
      },
    );
  }
}
