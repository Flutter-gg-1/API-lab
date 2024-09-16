import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handler/home_handler.dart';
import 'auth_router.dart';
import 'user_route.dart';
class HomeRoute {
  Handler get route {
    final route = Router()
      ..get("/", homeHandler);
    route.mount("/user", UserRoute().route);
    route.mount("/", AuthRoute().route);

    return route.call;
  }
}
