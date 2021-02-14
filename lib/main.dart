import 'package:flutter/material.dart';
import 'package:gym_app/views/home/Activities/Cafeteria/cafeteriaView.dart';
import 'package:gym_app/views/home/Activities/Supplements/supplementView.dart';
import 'package:gym_app/views/home/Team/TeamPage.dart';
import 'package:gym_app/views/customer/customer_home_view.dart';
import 'package:gym_app/views/login_view/login_view.dart';
import 'package:gym_app/views/onboarding_views/onboarding_carousel.dart';
import 'package:gym_app/views/trainer/cleints_list_batchwise.dart';
import 'package:gym_app/views/trainer/clients_details_view.dart';
import 'package:gym_app/views/trainer/trainer_home_view.dart';

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
      home: CustomerHome(),
      //OnboardingViews(),
      routes: {
        '/CustomerHome': (context) => CustomerHome(),
        '/ClientsList': (context) => ClientsList(),
        '/ClientsDetailsView': (context) => ClientsDetailsView(),
        '/LoginScreen': (context) => LoginView(),
        '/TeamPage': (context) => TeamPage(),
        'CafeteriaView': (context) => cafeteriaView(),
        'SupplementView': (context) => supplementView(),
      },
    );
  }
}
