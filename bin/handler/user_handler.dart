import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../model/movie_model.dart';
import '../movies/movie.dart';

userHandler(Request req) {
  const toke =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MCwidWVzciI6ImV4YW1wbGVAZW1haWwuY29tIiwiaWF0IjoxNzI2NTA3NTgxLCJpc3MiOiJodHRwczovL2dpdGh1Yi5jb20vam9uYXNyb3Vzc2VsL2RhcnRfanNvbndlYnRva2VuIn0.IiKk43q4NpVs8G2Kbjq64zUF-rTqp7MQVvcOyYSpjlU";
  print(req.headers['token']);
  if (req.headers['token'] == toke) {
    final myMovies = [];
    for (var movie in movies) {
      myMovies.add(MovieModel.fromJson(movie));
    }

    return Response.ok(jsonEncode(myMovies.map((e) => e.toJson()).toList()));
  }
  return Response.forbidden("you do not have athuraization");
}
