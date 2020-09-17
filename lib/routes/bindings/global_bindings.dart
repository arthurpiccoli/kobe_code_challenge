import 'package:get/get.dart';
import 'package:kobe_code_challenge/controllers/genres_controller.dart';

class GlobalBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GenresController(), permanent: true);
  }
}
