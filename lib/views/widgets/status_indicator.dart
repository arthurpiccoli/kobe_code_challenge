import 'package:flutter/material.dart';

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
              child: Text("RETRY"),
            )
          : Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),
    );
  }
}
