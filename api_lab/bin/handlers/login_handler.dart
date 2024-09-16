import 'package:shelf/shelf.dart';
import '../data/users.dart';

loginHandler(Request req) {
  if(users.containsKey(req.headers['user']) && users[req.headers['user']] == req.headers['password']) {
    return Response.ok("Login Successfull ✅");
  }
  return Response.unauthorized('Invalid email or password');
}