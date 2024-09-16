import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../model/movie.dart';
import '../../movies_data/movies_data.dart';

class MovieHandler {
  static fetchMovies(Request req) async {
    print('fetch movies was called!');
    final authorization = req.headers['authorization'];
    try {
      final _ = JWT.verify(authorization ?? '', SecretKey('secret passphrase'));

      List<Movie> movies = [];

      for (var movie in MoviesData.movies) {
        movies.add(Movie.fromJson(movie));
      }

      return Response.ok('Found ${movies.length} Movies!');
    } catch (e) {
      print('An Error was caught $e');
      return Response.badRequest();
    }
  }
}
