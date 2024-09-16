import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/home_handler.dart';
import '../handlers/login_handler.dart';
import '../handlers/movies_handler.dart';

class MainRoute {
  Handler get route {
    final handler = Router()
    ..get('/', homeHandler)
    ..get('/login', loginHandler)
    ..get('/movies', moviesHandler);

    return handler.call;
  }
}