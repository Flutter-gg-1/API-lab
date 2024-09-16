import 'package:shelf_router/shelf_router.dart';

import 'movie_handler.dart';

enum MoviePath { all }

class MovieRoute {
  static final String endPoint = '/movies';
  static get route {
    final app = Router()
      ..get('/${MoviePath.all.name}', MovieHandler.fetchMovies);
    return app.call;
  }
}
