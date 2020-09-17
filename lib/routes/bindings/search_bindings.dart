import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/search_movies_controller.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchMoviesController());
  }
}
