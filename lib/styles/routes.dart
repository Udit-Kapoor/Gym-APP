import 'package:flutter/widgets.dart';
import 'package:gym_app/lib.dart';

Map<String, Widget Function(BuildContext)> routesMap() => {
      '/CustomerHome': (context) => CustomerHome(),
      // '/ClientsList': (context) => ClientsList(),
      '/ClientsDetailsView': (context) => ClientsDetailsView(),
      '/TrainerHome': (context) => TrainerHome(),
      '/LoginScreen': (context) => LoginView(),
      '/TeamPage': (context) => TeamPage(),
      '/CafeteriaView': (context) => CafeteriaView(),
      '/SupplementView': (context) => SupplementView(),
      '/DietView': (context) => DietSubscription(),
      '/CafeteriaCart': (context) => CafeCart(),
    };
