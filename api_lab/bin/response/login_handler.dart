import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';
import '../data/data.dart';

loginHandler(Request req) async {
   // Parse the request body
    final body = await req.readAsString();
    final data = jsonDecode(body) as Map<String, dynamic>;
    final email = data['email'];
    final password = data['password'];
  for(var user in users) {
    if(user.email == email && user.password == password) {
      final jwt = JWT({
        'email': user.email,
        'password': user.password
      },
      issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
      );
      final token = jwt.sign(SecretKey('secret'));
      
      return Response.ok(
        jsonEncode({
        "msg" : "Login Successfull ✅",
        "token" : token
      }), headers: {'Content-Type': 'application/json'}
      );
    }
  }
  return Response.unauthorized('Invalid email or password');
}