import 'dart:convert';

import 'package:shelf/shelf.dart';

Response rootHandler(Request req) {
  return Response.ok(jsonEncode({"name": "Abdulaziz"}),
      headers: {"Content-Type": "application/json"});
}