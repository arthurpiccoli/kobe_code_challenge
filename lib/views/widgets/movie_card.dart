import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/constants/endpoints.dart';
import 'package:kobe_code_challenge/controllers/genres_controller.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/views/widgets/gradient_container.dart';
import 'package:kobe_code_challenge/utils/date_formatter.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      shape: ContinuousRectangleBorder(),
      child: Stack(
        children: [
          _buildbackgroundImage(),
          _buildTitle(),
          _buildInfo(),
        ],
      ),
    );
  }

  _buildbackgroundImage() {
    String imagePath = movie.backdropPath ?? movie.posterPath;
    return Container(
      height: 200,
      decoration: BoxDecoration(),
      child: imagePath != null
          ? Hero(
              flightShuttleBuilder: (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                return fromHeroContext.widget;
              },
              tag: "background_${movie.id}",
              child: Ink.image(
                image: NetworkImage(Endpoints.backdropUrl + imagePath),
                fit: BoxFit.cover,
                child: _buildInkWell(),
              ),
            )
          : _buildInkWell(),
    );
  }

  _buildInkWell() {
    return InkWell(
      onTap: () => Get.toNamed("/details", arguments: movie),
    );
  }

  _buildTitle() {
    return GradientContainer(
      child: Text(
        movie.title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  _buildInfo() {
    String releaseDate = movie.releaseDate.toShortDateString();
    String genreNames = _formatGenreNames();

    return Positioned(
      bottom: 0,
      left: 0,
      child: GradientContainer(
        child: Text("$releaseDate | $genreNames"),
        reverse: true,
      ),
    );
  }

  _formatGenreNames() {
    List<String> genreNames = Get.find<GenresController>()
        .mapMovieGenreIdsToGenreNames(movie.genreIds);
    return genreNames.reduce((value, element) => value + ', ' + element);
  }
}
