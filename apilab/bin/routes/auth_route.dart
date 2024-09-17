import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

final users = <String, String>{'user1': 'password123'}; // Users

class AuthRoute {
  // Declare tokens as static so it's accessible
  static final Map<String, String> tokens = <String, String>{};

  static String get endPoint => '/auth';

  static Router get route {
    final router = Router();

    router.post('/login', (Request req) async {
      final payload = await req.readAsString();
      final data = Uri.splitQueryString(payload);

      final username = data['username'];
      final password = data['password'];

      if (username != null && password != null && users[username] == password) {
        // Generate a simple token
        final token = '$username-token';
        tokens[username] = token; // Store token

        return Response.ok(jsonEncode({'token': token}));
      }

      return Response.forbidden('Invalid credentials');
    });

    return router;
  }
}
