import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'auth_route.dart';

class MainHandlers {
  Handler get route {
    final Router app = Router()
      ..get('/', (Request req) => Response.ok("Server is running"));
    return app.call;
  }
}
