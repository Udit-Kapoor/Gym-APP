import 'package:flutter/material.dart';
import 'package:gym_app/views/home/Team/TeamPage.dart';
import 'package:gym_app/views/customer/home_view.dart';
import 'package:gym_app/views/login_view/login_view.dart';
import 'package:gym_app/views/onboarding_views/onboarding_carousel.dart';
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
        buttonBarTheme: ButtonBarThemeData(
          alignment: MainAxisAlignment.center,
        ),
      ),
      routes: {
        '/': (context) => OnboardingViews(),
        '/HomePage': (context) => Home(),
        '/ClientsList': (context) => ClientsList(),
        '/ClientsDetailsView': (context) => ClientsDetailsView(),
        '/loginScreen': (context) => LoginView(),
        '/TeamPage': (context) => TeamPage(),
      },
    );
  }
}
