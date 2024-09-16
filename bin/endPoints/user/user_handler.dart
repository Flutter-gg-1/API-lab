import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../model/user.dart';

class UserHandler {
  static fetchUsers(Request req) async {
    print('fetch users was called!');
    final authorization = req.headers['authorization'];
    try {
      var response = jsonDecode(await req.readAsString());
      final _ = JWT.verify(authorization ?? '', SecretKey('secret passphrase'));
      var user = User.fromJson(response);
      print('I am here!');
      return Response.ok('Hello ${user.email}. Good to see you!');
    } catch (e) {
      print('An Error was caught $e');
      return Response.badRequest();
    }
  }
}
