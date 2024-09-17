


import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'login_route.dart';
import 'moveis_route.dart';



class MainRoute {
  Handler get route {
    final app = Router()
      ..mount("/auth", LoginRoute().route)
      ..mount("/movies",  MoviesRoute().route);

    return app.call;
  }
}
