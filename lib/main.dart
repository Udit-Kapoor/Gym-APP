import 'package:flutter/material.dart';
import 'package:gym_app/views/trainer/cleints_list_batchwise.dart';
import 'package:gym_app/views/trainer/clients_details_view.dart';

import 'views/trainer/batch_wise_clients_list_view.dart';

void main() {
  runApp(H2OApp());
}

  class H2OApp extends StatelessWidget {
    @override
    Widget build(_) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'H2O',
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => BatchWiseClientsListView(),
          '/ClientsList': (context) => ClientsList(),
          '/ClientsDetailsView': (context) => ClientsDetailsView(),
        },
      );
    }
  }
