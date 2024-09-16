import 'dart:convert';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import '../data/data.dart';

profileHandler(Request req) {
  final authHeader = req.headers['Authorization'];
  if (authHeader == null || !authHeader.startsWith('Bearer ')) {
    return Response.badRequest(
      body: jsonEncode({"msg": "ERROR WITH TOKEN FORMAT"}), 
      headers: {'Content-Type': 'application/json'}
    );
  }

  final token = authHeader.substring(7).trim();
  try {
    final jwt = JWT.verify(token, SecretKey('secret'));
    final email = jwt.payload['email'];
    final password = jwt.payload['password'];
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return Response.ok(
          jsonEncode(user.toJson()), 
          headers: {'Content-Type': 'application/json'}
        );
      }
    }
    return Response.notFound(
      jsonEncode({"msg": "User not found"}), 
      headers: {'Content-Type': 'application/json'}
    );

  } catch (e) {
    return Response.internalServerError(
      body: jsonEncode({"msg": "Internal Server Error", "error": e.toString()}),
      headers: {'Content-Type': 'application/json'}
    );
  }
}