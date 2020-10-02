import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/paginated_movies_base_controller.dart';
import 'package:kobe_code_challenge/data/repository.dart';
import 'package:kobe_code_challenge/models/paginated_movies.dart';
import 'package:kobe_code_challenge/utils/error_snackbar.dart';

class SearchMoviesController extends PaginatedMoviesBaseController {
  RxString _query = RxString();

  @override
  onInit() {
    debounce(_query, (_) async {
      movies.clear();
      page.value = 1;
      hasMorePages.value = true;
      if (_query.value.isNotEmpty) fetchMovies();
    });
  }

  @override
  Future<PaginatedMovies> getPaginatedMoviesFromRepository() {
    return Repository.searchMovies(query: _query.value, page: page.value);
  }

  @override
  void handleError(error) {
    showErrorSnackbar(error);
  }

  void search(String query) {
    _query.value = query;
  }
}
