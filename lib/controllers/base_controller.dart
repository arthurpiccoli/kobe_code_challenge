import 'package:get/get.dart';

enum ControllerStatus { busy, ready, error }

abstract class BaseController extends GetxController {
  final Rx<ControllerStatus> status = Rx<ControllerStatus>(
    ControllerStatus.ready,
  );

  bool get isReady => status.value == ControllerStatus.ready;
  bool get isBusy => status.value == ControllerStatus.busy;
  bool get hasError => status.value == ControllerStatus.error;
}
