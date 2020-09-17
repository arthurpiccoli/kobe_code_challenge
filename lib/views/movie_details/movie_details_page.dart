import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/views/movie_details/widgets/movie_details_app_bar.dart';

import 'package:kobe_code_challenge/views/movie_details/widgets/movie_details_list_view.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MovieDetailsAppBar(movie),
        ],
        body: MovieDetailsListView(movie),
      ),
    );
  }
}
