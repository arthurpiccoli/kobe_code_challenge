import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/constants/endpoints.dart';
import 'package:kobe_code_challenge/controllers/upcoming_movies_controller.dart';
import 'package:kobe_code_challenge/models/movie.dart';

class HomePage extends StatelessWidget {
  final upcomingMoviesController = Get.put(UpcomingMoviesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            onPressed: () => Get.toNamed("/search"),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: upcomingMoviesController.movies.length,
          itemBuilder: _tileBuilder,
        ),
      ),
    );
  }

  Widget _tileBuilder(BuildContext context, int index) {
    Movie movie = upcomingMoviesController.movies[index];

    Widget tile = ListTile(
      leading: movie.posterPath != null
          ? Image(
              image: NetworkImage(Endpoints.posterUrl + movie.posterPath),
            )
          : Container(),
      title: Text(movie.title),
      onTap: () => Get.toNamed("/details", arguments: movie),
    );

    if (movie == upcomingMoviesController.movies.last) {
      return Column(
        children: [
          tile,
          FlatButton(
            onPressed: upcomingMoviesController.fetchMovies,
            child: Text("..."),
          ),
        ],
      );
    }

    return tile;
  }
}
