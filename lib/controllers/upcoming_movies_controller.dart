import 'package:get/get.dart';
import 'package:kobe_code_challenge/data/repository.dart';
import 'package:kobe_code_challenge/models/movie.dart';
import 'package:kobe_code_challenge/models/paginated_movies.dart';

class UpcomingMoviesController extends GetxController {
  final RxList<Movie> movies = RxList<Movie>([]);
  final RxInt page = 1.obs;
  final RxBool hasMorePages = true.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  fetchMovies() async {
    if (!hasMorePages.value) return;

    PaginatedMovies paginatedMovies = await Repository.upcomingMovies(
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
