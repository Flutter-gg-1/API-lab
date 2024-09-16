import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class UserRoute {
  Handler get route {
    final route = Router()
      ..get("/myprofile", (Request req) {
        return Response.ok("user");
      });
    return route.call;
  }
}
