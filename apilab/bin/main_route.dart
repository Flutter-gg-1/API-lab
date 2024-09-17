import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'routes/auth_route.dart';
import 'routes/user_route.dart';
import 'routes/movie_route.dart';

class MainRoute {
  get handler {
    final app = Router()
      ..get('/', (Request req) => Response.ok('Server is running!\n'))
      ..mount(AuthRoute.endPoint, AuthRoute.route.call)
      ..mount(UserRoute.endPoint, UserRoute.route.call)
      ..mount(MovieRoute.endPoint, MovieRoute.route.call);

    return app.call;
  }
}
