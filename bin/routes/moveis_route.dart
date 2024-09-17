



import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../model/movies.dart';

class MoviesRoute {
  Handler get route {
    final app = Router()
      ..get("/All", (Request req) {
        
        return Response.ok(jsonEncode(movies) , headers: {'Content-Type': 'application/json'} );
      });

    return app.call;
  }
}
