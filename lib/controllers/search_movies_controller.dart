import 'package:get/get.dart';
import 'package:kobe_code_challenge/data/repository.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/models/paginated_movies.dart';

class SearchMoviesController extends GetxController {
  final RxList<Movie> movies = RxList<Movie>([]);
  final RxInt page = 1.obs;
  final RxBool hasMorePages = true.obs;
  String _query;

  search(String query) {
    _query = query;
    movies.clear();
    page.value = 1;
    hasMorePages.value = true;
    fetchMovies();
  }

  fetchMovies() async {
    if (!hasMorePages.value) return;

    PaginatedMovies paginatedMovies = await Repository.searchMovies(
      query: _query,
      page: page.value,
    );

    movies.addAll(paginatedMovies.results);
    if (paginatedMovies.page < paginatedMovies.totalPages) {
      page.value++;
    } else {
      hasMorePages.value = false;
    }
  }
}
