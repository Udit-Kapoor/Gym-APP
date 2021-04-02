import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

class GymHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: [false],
      future: ApiHelper().autoLogin(),
      builder: (c, s) {
        // var widget;
        if (s.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (s.data != null &&
            s.data[0] &&
            s.connectionState == ConnectionState.done) {
          switch (s.data[1]) {
            case "CUSTOMER":
              return CustomerHome();  
              break;
            case "TRAINER":
              return TrainerHome();
              break;
          }
        } 
      return OnboardingViews();
        // return widget;
      },
    );
  }
}
