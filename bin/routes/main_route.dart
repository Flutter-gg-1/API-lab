import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../response/display_all_movies_h.dart';
import '../response/log_in.dart';
import '../response/retrieves_user_h.dart';

class MainRoute {
  Handler get handler {
    final routEndpoint = Router()
      ..post("/login", loginUserHandler)
      ..get("/retrieves", retrievesUserHandler)
      ..get(
        "/display/all",
        displayALLMoviesHandler,
      );
    return routEndpoint.call;
  }
}
