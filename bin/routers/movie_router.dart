import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../dataset/movie_file.dart';

class MoviesRoute {
  Handler get route {
    final app = Router()
      ..get("/list/Movies", (Request req) {
        return Response.ok(jsonEncode(dataMoviee),
            headers: {'Content-Type': 'application/json'});
      });

    return app.call;
  }
}
