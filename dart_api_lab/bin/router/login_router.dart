import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handler/login_user_handler.dart';

class LoginRouter {
  Handler get route {
    final app = Router()
      ..get("/login", loginUserHandler);

    return app.call;
  }
}
