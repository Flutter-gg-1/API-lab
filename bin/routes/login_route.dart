import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../model/user.dart';

class LoginRoute {
  Handler get route {
    final app = Router()
      ..post("/login", (Request req) async {
        try {
          final body = await req.readAsString();

          final Map<String, dynamic> jsonData = jsonDecode(body);

          if (jsonData["email"] == users["email"] &&
              jsonData["pass"] == users["pass"]) {
            Map<String, dynamic> tempMap = {
              "email": jsonData["email"],
              "pass": jsonData["pass"]
            };

            final jwt = JWT(tempMap);

            final token = jwt.sign(SecretKey("ahhsahjashjajhs"));
            return Response.ok(token);
          }

          return Response.badRequest(body: "your are not user in the system");
        } catch (err) {
          print("hmmm");
          return Response.ok("give email and pass");
        }
      })
      ..post("/profile", (Request req) {
        try {
          final auth = req.headers['Authorization'];

          print(auth);

          if (auth == null) {
            return Response.forbidden("no token no in");
          }

          if (auth ==
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImExQGdtYWlsLmNvbSIsInBhc3MiOiIxMjMiLCJpYXQiOjE3MjY1NDY3NzV9.yIh4zZ1W-8kzC68VoCgjdCU7FZdo0q58VPxrJqKbehg") {
            return Response.ok(jsonEncode(users),
                headers: {'Content-Type': 'application/json'});
          }

          return Response.badRequest(body: "token not good");
        } catch (_) {
          return Response.badRequest(body: "there was some eorr");
        }
      });

    return app.call;
  }
}
