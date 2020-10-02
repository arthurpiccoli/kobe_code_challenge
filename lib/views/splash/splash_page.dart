import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:kobe_code_challenge/controllers/base_controller.dart';
import 'package:kobe_code_challenge/controllers/genres_controller.dart';
import 'package:kobe_code_challenge/routes/route_names.dart';
import 'package:kobe_code_challenge/views/widgets/status_indicator.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final genresController = Get.find<GenresController>();

  @override
  void initState() {
    ever(genresController.status, (status) {
      if (status == ControllerStatus.ready) Get.offNamed(RouteNames.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => StatusIndicator(
          hasError: genresController.hasError,
          errorCallback: genresController.fetchGenres,
        ),
      ),
    );
  }
}
