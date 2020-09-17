import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/upcoming_movies_controller.dart';
import 'package:kobe_code_challenge/views/widgets/movie_cards_list_view.dart';
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
            child: Icon(Icons.search, color: Colors.white),
          )
        ],
      ),
      body: MovieCardsListView(
        moviesController: upcomingMoviesController,
      ),
    );
  }
}
