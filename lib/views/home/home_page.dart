import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/constants/strings.dart';
import 'package:kobe_code_challenge/controllers/genres_controller.dart';
import 'package:kobe_code_challenge/controllers/upcoming_movies_controller.dart';
import 'package:kobe_code_challenge/routes/route_names.dart';
import 'package:kobe_code_challenge/views/widgets/movie_cards_list_view.dart';
import 'package:kobe_code_challenge/views/widgets/rounded_flat_button.dart';

class HomePage extends StatelessWidget {
  final upcomingMoviesController = Get.find<UpcomingMoviesController>();
  final genresController = Get.find<GenresController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          height: 24,
        ),
        actions: [
          RoundedFlatButton(
            onPressed: () => Get.toNamed(RouteNames.search),
            child: Icon(Icons.search, color: Colors.white),
          )
        ],
      ),
      body: MovieCardsListView(
        moviesController: upcomingMoviesController,
        listTitle: Strings.upcomingMovies,
      ),
    );
  }
}
