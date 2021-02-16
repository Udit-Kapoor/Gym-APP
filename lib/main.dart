import 'package:flutter/material.dart';
import 'package:gym_app/views/home/Activities/Cafeteria/cafeteriaView.dart';
import 'package:gym_app/views/home/Activities/Diet/dietSubscription.dart';
import 'package:gym_app/views/home/Activities/Supplements/supplementView.dart';
import 'package:gym_app/views/home/Team/TeamPage.dart';
import 'package:gym_app/views/customer/customer_home_view.dart';
import 'package:gym_app/views/login_view/login_view.dart';
import 'package:gym_app/views/onboarding_views/onboarding_carousel.dart';
import 'package:gym_app/views/trainer/cleints_list_batchwise.dart';
import 'package:gym_app/views/trainer/clients_details_view.dart';
import 'package:gym_app/views/trainer/trainer_home_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(H2OApp());
}

class H2OApp extends StatelessWidget {
  Future<List> autoLogin() async {
    final sp = await SharedPreferences.getInstance();
    var b = sp.containsKey("AUTH_KEY");
    var t;
    if (b) {
      t = sp.getString("USER_TYPE");
      return [b, t];
    }
    return [b];
  }

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
      home: FutureBuilder(
        initialData: [false],
        future: autoLogin(),
        builder: (c, s) {
          var widget;
          if (s.connectionState == ConnectionState.waiting) {
            widget = Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (s.data != null &&
              s.data[0] &&
              s.connectionState == ConnectionState.done) {
            switch (s.data[1]) {
              case "CUSTOMER":
                widget = CustomerHome();
                break;
              case "TRAINER":
                widget = TrainerHome();
                break;
            }
          } else
            widget = OnboardingViews();
          return widget;
        },
      ),
      routes: {
        //'/': (context) => ClientsDetailsView(),
        '/CustomerHome': (context) => CustomerHome(),
        '/ClientsList': (context) => ClientsList(),
        '/ClientsDetailsView': (context) => ClientsDetailsView(),
        '/TrainerHome': (context) => TrainerHome(),
        '/LoginScreen': (context) => LoginView(),
        '/TeamPage': (context) => TeamPage(),
        '/CafeteriaView': (context) => cafeteriaView(),
        '/SupplementView': (context) => supplementView(),
        '/DietView': (context) => dietSubscription(),
      },
    );
  }
}
