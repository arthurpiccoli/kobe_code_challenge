import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/upcoming_movies_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UpcomingMoviesController());
  }
}
