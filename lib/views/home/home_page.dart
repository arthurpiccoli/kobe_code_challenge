import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/upcoming_movies_controller.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/views/widgets/movie_card.dart';
import 'package:kobe_code_challenge/views/widgets/rounded_flat_button.dart';

class HomePage extends StatelessWidget {
  final upcomingMoviesController = Get.put(UpcomingMoviesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          RoundedFlatButton(
            onPressed: () => Get.toNamed("/search"),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: upcomingMoviesController.movies.length,
          itemBuilder: _cardBuilder,
        ),
      ),
    );
  }

  Widget _cardBuilder(BuildContext context, int index) {
    Movie movie = upcomingMoviesController.movies[index];

    if (movie == upcomingMoviesController.movies.last) {
      return Column(
        children: [
          MovieCard(movie),
          FlatButton(
            onPressed: upcomingMoviesController.fetchMovies,
            child: Text("..."),
          ),
        ],
      );
    }

    return MovieCard(movie);
  }
}
