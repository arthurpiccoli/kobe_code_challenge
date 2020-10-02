import 'package:get/state_manager.dart';
import 'package:kobe_code_challenge/controllers/base_controller.dart';
import 'package:kobe_code_challenge/data/repository.dart';
import 'package:kobe_code_challenge/models/genre.dart';
import 'package:kobe_code_challenge/utils/error_snackbar.dart';

class GenresController extends BaseController {
  RxList<Genre> movieGenres = RxList([]);

  @override
  void onInit() {
    fetchGenres();
  }

  void fetchGenres() async {
    if (this.isBusy) return;
    status.value = ControllerStatus.busy;
    try {
      movieGenres.addAll(await getMovieGenresFromRepository());
      status.value = ControllerStatus.ready;
    } catch (error) {
      status.value = ControllerStatus.error;
      handleError(error);
    }
  }

  Future<List<Genre>> getMovieGenresFromRepository() {
    return Repository.getMovieGenres();
  }

  void handleError(dynamic error) {
    showErrorSnackbar(error);
  }

  List<String> mapMovieGenreIdsToGenreNames(List ids) {
    return ids
        .map((id) => movieGenres.firstWhere((genre) => genre.id == id).name)
        .toList();
  }
}
