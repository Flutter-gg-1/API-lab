import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/log_in.dart';

class MainRoute {
  Handler get handler {
    final router = Router()..get("/", loginUserHandler);
    return router.call;
  }
}
