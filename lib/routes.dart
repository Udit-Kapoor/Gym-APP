import 'package:flutter/widgets.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> _routes = {
    '/ClientsDetailsView': (c) => ClientsDetailsView(),
  };

  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
