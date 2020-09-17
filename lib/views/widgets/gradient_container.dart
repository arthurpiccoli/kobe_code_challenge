import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final bool reverse;

  GradientContainer({this.child, this.reverse = false});

  @override
  Widget build(BuildContext context) {
    AlignmentGeometry begin =
        reverse ? Alignment.bottomCenter : Alignment.topCenter;
    AlignmentGeometry end =
        reverse ? Alignment.topCenter : Alignment.bottomCenter;

    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0),
          ],
        ),
      ),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }
}
