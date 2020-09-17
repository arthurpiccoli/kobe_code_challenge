import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/search_movies_controller.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/views/widgets/movie_card.dart';

class SearchPage extends StatelessWidget {
  final searchMoviesController = Get.put(SearchMoviesController());
  final textEditingController = TextEditingController(); //TODO dispose

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textEditingController,
          onChanged: searchMoviesController.search,
          autofocus: true,
        ),
      ),
      body: GestureDetector(
        onTap: () => dismissKeyboard(context),
        child: Obx(
          () => ListView.builder(
            itemCount: searchMoviesController.movies.length,
            itemBuilder: _cardBuilder,
          ),
        ),
      ),
    );
  }

  void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
  }

  Widget _cardBuilder(BuildContext context, int index) {
    Movie movie = searchMoviesController.movies[index];

    if (movie == searchMoviesController.movies.last) {
      return Column(
        children: [
          MovieCard(movie),
          FlatButton(
            onPressed: searchMoviesController.fetchMovies,
            child: Text("..."),
          ),
        ],
      );
    }

    return MovieCard(movie);
  }
}
