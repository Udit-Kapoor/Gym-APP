import 'package:flutter/widgets.dart';

import 'views/customer/customer_drawer/customer_profile_view.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> _routes = {
    '/': (c) => CustomerProfileView(),
  };

  Map<String, Widget Function(BuildContext)> get routes => _routes;
}
