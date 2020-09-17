import 'package:get/get.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/models/paginated_movies.dart';

enum ControllerStatus { busy, ready, error }

abstract class PaginatedMoviesBaseController extends GetxController {
  final Rx<ControllerStatus> status = Rx<ControllerStatus>(
    ControllerStatus.ready,
  );

  bool get isReady => status.value == ControllerStatus.ready;
  bool get isBusy => status.value == ControllerStatus.busy;
  bool get hasError => status.value == ControllerStatus.error;

  final RxList<Movie> movies = RxList<Movie>([]);
  final RxInt page = 1.obs;
  final RxBool hasMorePages = true.obs;

  fetchMovies() async {
    if (!hasMorePages.value) return;

    if (this.isBusy) return;
    status.value = ControllerStatus.busy;

    try {
      PaginatedMovies paginatedMovies =
          await getPaginatedMoviesFromRepository();

      movies.addAll(paginatedMovies.results);
      if (paginatedMovies.page < paginatedMovies.totalPages) {
        page.value++;
      } else {
        hasMorePages.value = false;
      }
      status.value = ControllerStatus.ready;
    } catch (error) {
      status.value = ControllerStatus.error;
      handleError(error);
    }
  }

  Future<PaginatedMovies> getPaginatedMoviesFromRepository();

  void handleError(dynamic error);
}
