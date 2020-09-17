import 'package:get/get.dart';
import 'package:kobe_code_challenge/data/repository.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/models/paginated_movies.dart';
import 'package:kobe_code_challenge/utils/error_snackbar.dart';

class SearchMoviesController extends GetxController {
  final RxList<Movie> movies = RxList<Movie>([]);
  final RxInt page = 1.obs;
  final RxBool hasMorePages = true.obs;
  RxString _query = RxString();

  @override
  onInit() {
    debounce(_query, (_) async {
      movies.clear();
      page.value = 1;
      hasMorePages.value = true;
      fetchMovies();
    });
  }

  search(String query) {
    _query.value = query;
  }

  fetchMovies() async {
    if (!hasMorePages.value) return;
    if (_query.value.isEmpty) return;

    try {
      PaginatedMovies paginatedMovies = await Repository.searchMovies(
        query: _query.value,
        page: page.value,
      );

      movies.addAll(paginatedMovies.results);
      if (paginatedMovies.page < paginatedMovies.totalPages) {
        page.value++;
      } else {
        hasMorePages.value = false;
      }
    } catch (error) {
      showErrorSnackbar(error);
    }
  }
}
