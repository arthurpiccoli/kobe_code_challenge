import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/paginated_movies_base_controller.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/views/widgets/movie_card.dart';
import 'package:kobe_code_challenge/views/widgets/status_indicator.dart';

class MovieCardsListView extends StatefulWidget {
  final PaginatedMoviesBaseController moviesController;
  final String listTitle;

  MovieCardsListView({
    @required this.moviesController,
    this.listTitle,
  });

  @override
  _MovieCardsListViewState createState() => _MovieCardsListViewState();
}

class _MovieCardsListViewState extends State<MovieCardsListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(scrollPageLoader);
    super.initState();
  }

  void scrollPageLoader() {
    if (!scrollController.hasClients) return;

    bool reachedBottomEdge =
        scrollController.offset >= scrollController.position.maxScrollExtent;
    bool hasMorePages = widget.moviesController.hasMorePages.value;
    bool isReady = widget.moviesController.isReady;

    if (reachedBottomEdge && hasMorePages && isReady) {
      widget.moviesController.fetchMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => widget.moviesController.movies.isEmpty
          ? widget.moviesController.isReady
              ? Container()
              : _buildStatusIndicator()
          : ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 5),
              controller: scrollController,
              itemCount: widget.moviesController.movies.length,
              itemBuilder: _cardBuilder,
            ),
    );
  }

  Widget _cardBuilder(BuildContext context, int index) {
    Movie movie = widget.moviesController.movies[index];

    bool shouldShowListTitle = movie == widget.moviesController.movies.first &&
        widget.listTitle != null;

    if (shouldShowListTitle) {
      return _buildMovieCardWithListTitle(movie);
    }

    bool shouldShowStatusIndicator =
        movie == widget.moviesController.movies.last &&
            widget.moviesController.hasMorePages.value;

    if (shouldShowStatusIndicator) {
      return _buildMovieCardWithStatusIndicator(movie);
    }

    return MovieCard(movie);
  }

  _buildMovieCardWithListTitle(Movie movie) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildListTitle(),
        MovieCard(movie),
      ],
    );
  }

  _buildListTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "| ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Get.theme.accentColor,
              ),
            ),
            TextSpan(text: widget.listTitle)
          ],
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  _buildMovieCardWithStatusIndicator(Movie movie) {
    return Column(
      children: [
        MovieCard(movie),
        Obx(() => _buildStatusIndicator()),
      ],
    );
  }

  _buildStatusIndicator() {
    return StatusIndicator(
      hasError: widget.moviesController.hasError,
      errorCallback: widget.moviesController.fetchMovies,
    );
  }
}
