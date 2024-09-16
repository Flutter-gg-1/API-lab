import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handler/user_handler.dart';

class UserRoute {
  Handler get route {
    final route = Router()
      ..put("/myprofile", userHandler);
    return route.call;
  }
}
