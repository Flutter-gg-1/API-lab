import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class TokenMgr {
  static void createToken(Map myMap) {
    final jwt = JWT(
      myMap,
      issuer: 'https://github.com/jonasroussel/dart_jsonwebtoken',
    );

    final token = jwt.sign(SecretKey('secret passphrase'));

    print('Signed token: $token\n');
  }
}
