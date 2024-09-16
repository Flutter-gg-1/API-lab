import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'router/home_router.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

void main(List<String> args) async {
  withHotreload(() => createServer());
  // Use any available host or container IP (usually `0.0.0.0`).
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(HomeRoute().route);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print("localhost:$port");
  print('Server listening on port ${server.port}');
  return server;
}
