import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

import 'router/main_router.dart';

// Configure routes.

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  withHotreload(
    () => createServer(),
    onReloaded: () => print('Reload!'),
    onHotReloadNotAvailable: () => print('No hot-reload :('),
    onHotReloadAvailable: () => print('Yay! Hot-reload :)'),
    onHotReloadLog: (log) => print('Reload Log: ${log.message}'),
    logLevel: Level.INFO,
  );
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(MainRouter().route);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
  return server;
}
