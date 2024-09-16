import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/home_handler.dart';

class MainRoute {
  Handler get route {
    final handler = Router()
    ..get('/', homeHandler);

    return handler.call;
  }
}