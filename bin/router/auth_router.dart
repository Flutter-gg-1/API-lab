import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class AuthRoute {
  Handler get route {
    final route = Router()
      ..put("/login", (Request req) {
        print("${req.headers["user"]}");

        final jwt = JWT(
          // Payload
          {'id': 0, "uesr": req.headers["user"]},
          issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
        );

// Sign it (default with HS256 algorithm)
        final token = jwt.sign(SecretKey(''));
        print(token);
        final userSecret = {"user": req.headers["user"], "token": token};
        return Response.ok(jsonEncode(userSecret));
      });

    return route.call;
  }
}
