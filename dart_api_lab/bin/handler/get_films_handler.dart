import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../json/film.dart';
import '../model/film_model.dart';

getFilmsHandler(Request req) {
  List<FilmModel> filmLayer = [];
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTAwMSwiZW1haWwiOiJhbGlAYWxpLmNvbSIsInBhc3MiOiIxMjMiLCJpYXQiOjE3MjY1MDUxMzUsImlzcyI6IkkgYW0gdGFyb290aSBtYW4ifQ.fyDe04ewqWnJlhKz2Sq_WiYSs14uPtFRclWPNRhQ-c4";
  if (req.headers["authorization"] == "Bearer $token") {
    for (var element in films) {
      filmLayer.add(FilmModel.fromJson(element));
    }

    return Response.ok(jsonEncode(filmLayer),
        headers: {"Content-Type": "application/json"});
  }
  return Response.unauthorized("Please login first to see the films");
}
