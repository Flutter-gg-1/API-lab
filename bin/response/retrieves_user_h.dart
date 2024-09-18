import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../data/data.dart';

Future<Response> retrievesUserHandler(Request req) async {
  final token = req.headers['Authorization'];
  if (token == null) {
    return Response.forbidden('No token provided');
  }

  final email = utf8.decode(base64.decode(token));

  final user = users.firstWhere(
    (user) => user.email == email,
  );

  return Response.ok(jsonEncode({'email': user.email}),
      headers: {'Content-Type': 'application/json'});
}
