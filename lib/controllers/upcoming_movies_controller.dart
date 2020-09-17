import 'package:kobe_code_challenge/controllers/paginated_movies_base_controller.dart';
import 'package:kobe_code_challenge/data/repository.dart';
import 'package:kobe_code_challenge/models/paginated_movies.dart';
import 'package:kobe_code_challenge/utils/error_snackbar.dart';

class UpcomingMoviesController extends PaginatedMoviesBaseController {
  @override
  void onInit() {
    fetchMovies();
  }

  @override
  Future<PaginatedMovies> getPaginatedMoviesFromRepository() {
    return Repository.getUpcomingMovies(page: page.value);
  }

  @override
  void handleError(error) {
    showErrorSnackbar(error);
  }
}
