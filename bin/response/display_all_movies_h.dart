import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../data/data.dart';

displayALLMoviesHandler(Response req) {
  return Response.ok(jsonEncode(films.map((movie) => movie).toList()),
      headers: {'Content-Type': 'application/json'});
}
