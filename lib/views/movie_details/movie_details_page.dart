import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/constants/endpoints.dart';
import 'package:kobe_code_challenge/models/movie.dart';

class MovieDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Movie movie = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: ListView(
        children: [
          if (movie.backdropPath != null)
            Image(
              image: NetworkImage(Endpoints.backdropUrl + movie.backdropPath),
            ),
          Text(movie.overview),
        ],
      ),
    );
  }
}
