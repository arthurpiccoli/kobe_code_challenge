import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/constants/endpoints.dart';
import 'package:kobe_code_challenge/controllers/search_movies_controller.dart';
import 'package:kobe_code_challenge/models/movie.dart';

class SearchPage extends StatelessWidget {
  final searchMoviesController = Get.put(SearchMoviesController());
  final textEditingController = TextEditingController(); //TODO dispose

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textEditingController,
          onSubmitted: searchMoviesController.search,
        ),
        actions: [
          FlatButton(
            onPressed: () =>
                searchMoviesController.search(textEditingController.text),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: searchMoviesController.movies.length,
          itemBuilder: _tileBuilder,
        ),
      ),
    );
  }

  Widget _tileBuilder(BuildContext context, int index) {
    Movie movie = searchMoviesController.movies[index];

    Widget tile = ListTile(
      leading: movie.posterPath != null
          ? Image(
              image: NetworkImage(Endpoints.posterUrl + movie.posterPath),
            )
          : Container(),
      title: Text(movie.title),
      onTap: () => Get.toNamed("/details", arguments: movie),
    );

    if (movie == searchMoviesController.movies.last) {
      return Column(
        children: [
          tile,
          FlatButton(
            onPressed: searchMoviesController.fetchMovies,
            child: Text("..."),
          ),
        ],
      );
    }

    return tile;
  }
}
