import 'dart:convert';

import 'package:shelf/shelf.dart';
import '../data/data.dart';

moviesHandler(Request req) {
  return Response.ok(jsonEncode(movies), headers: {'Content-Type': 'application/json'});
}