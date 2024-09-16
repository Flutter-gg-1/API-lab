import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'auth_route.dart';
import 'movie_route.dart';
import 'user_route.dart';

class MainRoute {
  get route {
    final app = Router()
      ..get("/", (Request req) {
        return Response.ok('Server is Running');
      })
      ..mount(AuthRoute.endPoint, AuthRoute.route)
      ..mount(UserRoute.endPoint, UserRoute.route)
      ..mount(MovieRoute.endPoint, MovieRoute.route);

    return app.call;
  }
}

/*
Paths:

/auth/login
/user/hello
/movies/all

*/
