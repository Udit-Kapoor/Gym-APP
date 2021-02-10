import 'package:flutter/material.dart';
import 'package:gym_app/views/home/home_view.dart';
import 'package:gym_app/views/home/my_trainer.dart';
import 'package:gym_app/views/trainer/cleints_list_batchwise.dart';
import 'package:gym_app/views/trainer/clients_details_view.dart';


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
          '/': (context) => Home(),
          '/ClientsList': (context) => ClientsList(),
          '/ClientsDetailsView': (context) => ClientsDetailsView(),

          '/MyTrainer':(context)=>MyTrainer(),
        },
      );
    }
  }
