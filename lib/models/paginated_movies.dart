import 'package:kobe_code_challenge/models/movie.dart';

class PaginatedMovies {
  final List<Movie> results;
  final int page;
  final int totalResults;
  final int totalPages;

  PaginatedMovies({
    this.results,
    this.page,
    this.totalResults,
    this.totalPages,
  });

  factory PaginatedMovies.fromJson(Map<String, dynamic> json) {
    List<Movie> results = [];
    json["results"].forEach(
      (movieJson) => results.add(Movie.fromJson(movieJson)),
    );

    return PaginatedMovies(
      results: results,
      page: json["page"],
      totalResults: json["total_results"],
      totalPages: json["total_pages"],
    );
  }
}
