import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

import 'main_route.dart';

void main() async {
  await createServer();
}

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;

  final handler =
      Pipeline().addMiddleware(logRequests()).addHandler(MainRoute().handler);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server running at http://${server.address.host}:$port');

  return server;
}
