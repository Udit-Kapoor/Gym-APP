import 'package:flutter/widgets.dart';
import 'package:gym_app/views/views.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> _routes = {
    '/': (c) => CustomerProfileView(),
    //'/': (c) => Home(),
  };

  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
