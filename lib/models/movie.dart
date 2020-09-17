class Movie {
  final num popularity;
  final int voteCount;
  final bool video;
  final String posterPath;
  final int id;
  final bool adult;
  final String backdropPath;
  final String originalLanguage;
  final String originalTitle;
  final List genreIds;
  final String title;
  final num voteAverage;
  final String overview;
  final DateTime releaseDate;

  Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      popularity: json["popularity"],
      voteCount: json["vote_count"],
      video: json["video"],
      posterPath: json["poster_path"],
      id: json["id"],
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      genreIds: json["genre_ids"],
      title: json["title"],
      voteAverage: json["vote_average"],
      overview: json["overview"],
      releaseDate: DateTime.tryParse(json["release_date"]),
    );
  }
}
