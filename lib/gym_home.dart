import 'package:flutter/material.dart';
import 'package:gym_app/lib.dart';

class GymHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: [false],
      future: ApiHelper().autoLogin(),
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
    );
  }
}
