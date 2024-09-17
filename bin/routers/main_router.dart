import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'auth_router.dart';
import 'movie_router.dart';

class MainRoute {
  Handler get router {
    final Router app = Router()
      ..get("/", (Request req) {
        return Response.ok('Success');
      })
      ..mount("/auth", AuthRouter().route)
      ..mount("/movie", MoviesRoute().route);
    //MoviesRoute
    return app.call;
  }
}
