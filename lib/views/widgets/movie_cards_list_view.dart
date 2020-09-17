import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/paginated_movies_base_controller.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/views/widgets/movie_card.dart';
import 'package:kobe_code_challenge/views/widgets/status_indicator.dart';

class MovieCardsListView extends StatefulWidget {
  final PaginatedMoviesBaseController moviesController;
  MovieCardsListView({@required this.moviesController});

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
              controller: scrollController,
              itemCount: widget.moviesController.movies.length,
              itemBuilder: _cardBuilder,
            ),
    );
  }

  Widget _cardBuilder(BuildContext context, int index) {
    Movie movie = widget.moviesController.movies[index];

    bool shouldShowStatusIndicator =
        movie == widget.moviesController.movies.last &&
            widget.moviesController.hasMorePages.value;

    if (shouldShowStatusIndicator) {
      return Column(
        children: [
          MovieCard(movie),
          Obx(() => _buildStatusIndicator()),
        ],
      );
    }

    return MovieCard(movie);
  }

  _buildStatusIndicator() {
    return StatusIndicator(
      hasError: widget.moviesController.hasError,
      errorCallback: widget.moviesController.fetchMovies,
    );
  }
}
