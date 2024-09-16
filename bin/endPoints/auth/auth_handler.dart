import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../token_mgr.dart';

class AuthHandler {
  static loginHandler(Request req) async {
    print('Auth handler was called!');
    try {
      final body = jsonDecode(await req.readAsString());
      if (body is! Map) {
        return Response.badRequest();
      } else {
        // Check parameters
        if (body.keys.contains('email') && (body.keys.contains('password'))) {
          // Create Token
          TokenMgr.createToken(body);
          return Response.ok('Authentication Successful!');
        } else {
          return Response.badRequest(body: 'Required parameters are not found');
        }
      }
    } catch (e) {
      return Response.badRequest(
          body: 'There was an issue decoding the request!');
    }
  }
}
