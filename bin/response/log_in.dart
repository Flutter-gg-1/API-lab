import 'dart:convert';
import 'package:shelf/shelf.dart';
import '../data/data.dart';

Future<Response> loginUserHandler(Request req) async {
  final payload = await req.readAsString();
  final data = jsonDecode(payload);

  final email = data['email'];
  final password = data['password'];

  final user = users.firstWhere(
    (user) => user.email == email && user.password == password,
  );

  final token = base64.encode(utf8.encode(user.email));
  return Response.ok(jsonEncode({'token': token}),
      headers: {'Content-Type': 'application/json'});
}
