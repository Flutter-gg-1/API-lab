import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../response/log_in.dart';

class MainRoute {
  Handler get handler {
    final routEndpoint = Router()..post("/login", loginUserHandler)..put("/retrieves", handler);
    return routEndpoint.call;
  }
}
