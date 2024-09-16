import 'package:shelf_router/shelf_router.dart';

import 'auth_handler.dart';

class AuthRoute {
  static final String endPoint = '/auth';
  static get route {
    final app = Router()
      ..post('/${AuthEndpoint.login.name}', AuthHandler.loginHandler);
    return app.call;
  }
}

enum AuthEndpoint {
  login,
}
