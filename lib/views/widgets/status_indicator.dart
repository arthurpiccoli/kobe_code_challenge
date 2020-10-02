import 'package:flutter/material.dart';
import 'package:kobe_code_challenge/constants/strings.dart';

class StatusIndicator extends StatelessWidget {
  final bool hasError;
  final void Function() errorCallback;

  StatusIndicator({
    this.hasError = false,
    this.errorCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: hasError
          ? RaisedButton(
              onPressed: errorCallback,
              child: Text(Strings.retry),
            )
          : Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),
    );
  }
}
