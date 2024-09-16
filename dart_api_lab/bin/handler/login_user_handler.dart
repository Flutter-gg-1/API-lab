import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../data_layer/user_layer.dart';
import '../model/user_model.dart';

loginUserHandler(Request req) async {
  final body = await req.readAsString();
  final json = jsonDecode(body);
  late UserModel userInfo;
  bool isLogin = false;
  if (json is! Map) {
    return Response.badRequest(body: "Body isn't correct");
  }
  for (var element in users) {
    if (json["email"] == element.email && json["password"] == element.pass) {
      userInfo = element;
      isLogin = true;
      break;
    }
  }

// Sign it (default with HS256 algorithm)

  if (isLogin) {
    final x = userInfo.toJson();
    final jwt = JWT(
      // Payload
      x,
      issuer: 'I am tarooti man',
    );
    final token = jwt.sign(SecretKey('secret passphrase'));
    final Map token_map = {"token": token};
    Map<String, dynamic> combinedMap = {
      ...x,
      ...token_map,
    };
    return Response(200,
        body: jsonEncode(combinedMap),
        headers: {"Content-Type": "Application/json"});
  }

  return Response.badRequest(body: "Please check your username & password");
}
