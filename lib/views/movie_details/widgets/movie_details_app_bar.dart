import 'package:flutter/material.dart';
import 'package:kobe_code_challenge/constants/endpoints.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/views/widgets/gradient_container.dart';

class MovieDetailsAppBar extends StatelessWidget {
  final Movie movie;
  MovieDetailsAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(movie.title),
        background: _buildBackground(),
      ),
    );
  }

  _buildBackground() {
    if (movie.backdropPath == null) {
      return GradientContainer(reverse: true);
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackgroundImage(),
        GradientContainer(reverse: true),
      ],
    );
  }

  _buildBackgroundImage() {
    return Hero(
      flightShuttleBuilder: (
        flightContext,
        animation,
        flightDirection,
        fromHeroContext,
        toHeroContext,
      ) {
        return toHeroContext.widget;
      },
      tag: "background_${movie.id}",
      child: Image.network(
        Endpoints.backdropUrl + movie.backdropPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
