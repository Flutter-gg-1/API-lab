import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handler/auth_handler.dart';

class AuthRoute {
  Handler get route {
    final route = Router()..put("/login", authHandler);

    return route.call;
  }
}
