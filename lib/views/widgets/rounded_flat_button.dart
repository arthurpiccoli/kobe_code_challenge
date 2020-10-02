import 'package:flutter/material.dart';

class RoundedFlatButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final double radius;

  RoundedFlatButton({
    @required this.onPressed,
    @required this.child,
    this.radius = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      height: radius * 2,
      width: radius * 2,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: onPressed,
        child: child,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
