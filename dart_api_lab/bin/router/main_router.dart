import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handler/get_films_handler.dart';
import 'login_router.dart';

class MainRouter {
  Handler get route {
    final app = Router()
      ..get("/main", getFilmsHandler)
      ..mount("/auth", LoginRouter().route);

    return app.call;
  }
}
