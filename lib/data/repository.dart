import 'package:dio/dio.dart';
import 'package:kobe_code_challenge/constants/credentials.dart';
import 'package:kobe_code_challenge/constants/endpoints.dart';
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

  static Future<PaginatedMovies> upcomingMovies({int page}) async {
    try {
      Response response = await _dio.get(
        Endpoints.upcomingMovies,
        queryParameters: {"page": page},
      );
      return PaginatedMovies.fromJson(response.data);
    } on DioError catch (error) {
      print(error);
      return null; //TODO
    }
  }

  static Future<PaginatedMovies> searchMovies({String query, int page}) async {
    try {
      Response response = await _dio.get(
        Endpoints.searchMovies,
        queryParameters: {
          "query": query,
          "page": page,
        },
      );
      return PaginatedMovies.fromJson(response.data);
    } on DioError catch (error) {
      print(error);
      return null; //TODO
    }
  }
}
