import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../response/home_handler.dart';
import '../response/login_handler.dart';
import '../response/movies_handler.dart';
import '../response/profile_handler.dart';

class MainRoute {
  Handler get route {
    final handler = Router()
    ..get('/', homeHandler)
    ..post('/login', loginHandler)
    ..get('/movies', moviesHandler)
    ..get('/profile', profileHandler);
    return handler.call;
  }
}