import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/constants/endpoints.dart';
import 'package:kobe_code_challenge/constants/strings.dart';
import 'package:kobe_code_challenge/controllers/genres_controller.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/utils/date_formatter.dart';

class MovieDetailsListView extends StatelessWidget {
  final Movie movie;
  MovieDetailsListView(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Row(
            children: [
              if (movie.posterPath != null) _buildPoster(),
              _buildInfoColumn(),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(movie.overview),
        ),
      ],
    );
  }

  _buildPoster() {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Image.network(
        Endpoints.posterUrl + movie.posterPath,
        width: 116,
        height: 174,
      ),
    );
  }

  _buildInfoColumn() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleText(Strings.releaseDate),
          _buildInfoText("${movie.releaseDate.toShortDateString()}"),
          Divider(),
          _buildTitleText(Strings.genres),
          _buildInfoText("${_formatGenreNames()}")
        ],
      ),
    );
  }

  _buildTitleText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(color: Colors.white60),
      ),
    );
  }

  _buildInfoText(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 15),
    );
  }

  _formatGenreNames() {
    List<String> genreNames = Get.find<GenresController>()
        .mapMovieGenreIdsToGenreNames(movie.genreIds);

    if (genreNames.isEmpty) return Strings.unclassificated;

    return genreNames.reduce((value, element) => value + '\n' + element);
  }
}
