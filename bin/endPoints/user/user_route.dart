import 'package:shelf_router/shelf_router.dart';

import 'user_handler.dart';

enum UserPath { hello }

class UserRoute {
  static final String endPoint = '/user';
  static get route {
    final app = Router()
      ..post('/${UserPath.hello.name}', UserHandler.fetchUsers);
    return app.call;
  }
}

// Middleware checkToekn = (innerHandler) => (Request req) {
//       if (req.headers['authorization'] == '') {
//         return innerHandler(req);
//       }
//       return Response.unauthorized(
//           "You are not authorized to access this page");
//     };
