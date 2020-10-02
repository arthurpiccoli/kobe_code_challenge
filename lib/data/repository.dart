import 'package:dio/dio.dart';
import 'package:kobe_code_challenge/constants/credentials.dart';
import 'package:kobe_code_challenge/constants/endpoints.dart';
import 'package:kobe_code_challenge/models/genre.dart';
import 'package:kobe_code_challenge/models/paginated_movies.dart';

abstract class Repository {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.apiUrl,
      queryParameters: {
        "api_key": Credentials.apiKey,
      },
    ),
  );

  static Future<PaginatedMovies> getUpcomingMovies({int page}) async {
    Response response = await _dio.get(
      Endpoints.upcomingMovies,
      queryParameters: {"page": page},
    );
    return PaginatedMovies.fromJson(response.data);
  }

  static Future<PaginatedMovies> searchMovies({String query, int page}) async {
    Response response = await _dio.get(
      Endpoints.searchMovies,
      queryParameters: {
        "query": query,
        "page": page,
      },
    );
    return PaginatedMovies.fromJson(response.data);
  }

  static Future<List<Genre>> getMovieGenres() async {
    Response response = await _dio.get(Endpoints.movieGenres);

    List<Genre> genres = [];
    response.data["genres"].forEach(
      (genreJson) => genres.add(Genre.fromJson(genreJson)),
    );

    return genres;
  }
}
