import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../model/user.dart';

class AuthRouter {
  // Handler get router {
  //   final router = Router()..post("/login", loginUserHandler);
  //   final pipeline = Pipeline().addHandler(router.call);
  //   return pipeline.call;
  // }
  bool isLogin = false;
  Handler get route {
    final app = Router()
      ..post("/login", (Request req) async {
        final body = await req.readAsString();

        final Map<String, dynamic> jsonData = jsonDecode(body);

        if (jsonData["email"] == users["email"] &&
            jsonData["pass"] == users["pass"] &&
            jsonData["name"] == users["name"]) {
          isLogin = true;
          Map<String, dynamic> tempMap = {
            "email": jsonData["email"],
            "pass": jsonData["pass"]
          };

          final jwt = JWT(tempMap);

          final token = jwt.sign(SecretKey("secret passphrase"));
          return Response.ok(token);
        } else {
          return Response.badRequest(body: "email or password is wrong ");
        }
      })
      ..post("/profile", (Request req) {
        final auth = req.headers['Authorization'];
        if (auth ==
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYW5hcyIsImVtYWlsIjoiYW5hc0AuZ21haWwuY29tIiwicGFzcyI6IjAwMCJ9.S8Eh4alWc6mj6xNJTEh_EHYbnw4om7WqfvYekE8B2SQ") {
          return Response.ok(jsonEncode(users),
              headers: {'Content-Type': 'application/json'});
        } else {
          return Response.forbidden("no token no in");
        }
      });

    return app.call;
  }
}
