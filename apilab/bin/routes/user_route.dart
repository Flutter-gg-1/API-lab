import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'auth_route.dart';

class UserRoute {
  static String get endPoint => '/user';

  static Router get route {
    final router = Router();

    router.get('/profile', (Request req) {
      final token = req.headers['Authorization'];
      if (token == null || !AuthRoute.tokens.containsValue(token)) {
        return Response.forbidden('Unauthorized');
      }

      final username = AuthRoute.tokens.entries
          .firstWhere((element) => element.value == token)
          .key;

      return Response.ok(jsonEncode({'profile': '$username\'s profile'}));
    });

    return router;
  }
}
