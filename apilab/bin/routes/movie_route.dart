import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../../models/movie.dart';

class MovieRoute {
  static String get endPoint => '/movies';

  static Router get route {
    final router = Router();

    final movies = [
      Movie(title: 'Interstellar', director: 'Christopher Nolan', year: 2014),
      Movie(title: 'The Matrix', director: 'The Wachowskis', year: 1999),
    ];

    router.get('/all', (Request req) {
      return Response.ok(
        jsonEncode(movies.map((movie) => movie.toJson()).toList()),
        headers: {'Content-Type': 'application/json'},
      );
    });

    return router;
  }
}
