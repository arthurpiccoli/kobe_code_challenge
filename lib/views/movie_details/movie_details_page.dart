import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/constants/endpoints.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/views/movie_details/widgets/movie_details_app_bar.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MovieDetailsAppBar(movie),
        ],
        body: ListView(
          children: [
            _buildInfoRow(),
            Divider(),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(movie.overview),
            ),
          ],
        ),
      ),
    );
  }

  _buildInfoRow() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: [
          if (movie.posterPath != null)
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Image.network(
                Endpoints.posterUrl + movie.posterPath,
                width: 120,
                fit: BoxFit.fitWidth,
              ),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Release date:\n${movie.releaseDate}"),
                Divider(),
                Text("Genres:\n${movie.genreIds}")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
