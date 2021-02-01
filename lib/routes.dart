import 'package:flutter/widgets.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> _routes = {
    '/': (c) => null,
  };

  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
