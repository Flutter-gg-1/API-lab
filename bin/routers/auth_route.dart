import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import '../data_sets/accounts.dart';
import '../data_sets/films.dart';
import '../handlers/auth_handler/login_handler.dart';
import 'main_route.dart';

final jwt = JWT(
  {
    'id': 123,
    'server': {
      'id': '3e4fc296',
      'loc': 'euw-2',
    }
  },
  issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
);
final token = jwt.sign(SecretKey(""));

class AuthRoute {
  Handler get route {
    final route = Router()
      ..post("/login", loginHandle)
      ..mount("/main", MainHandlers().route);
    return route.call;
  }
}

class getToken {
  Handler get route {
    final route = Router()
      ..get("/generate", (Request req) {
        if (req.headers['email'] == account['email'] &&
            req.headers['password'] == account['password']) {
          return Response(200, body: jsonEncode(token));
        }
        return Response.badRequest(body: "Wrong email..");
      })
      ..mount("/generate/token", LoginRoute().route);
    return route.call;
  }
}

class LoginRoute {
  Handler get route {
    final app = Router()
      ..get("/login", (Request req) {
        if (req.headers['authorization'] == "Bearer $token") {
          return Response.ok(jsonEncode(films),
              headers: {"Content-Type": "application/json"});
        }
        return Response.badRequest(body: "Error!");
      });
    return app.call;
  }
}
