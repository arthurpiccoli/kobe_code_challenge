import 'package:kobe_code_challenge/constants/strings.dart';

extension DateFormatter on DateTime {
  String toShortDateString() {
    if (this == null) return Strings.undefined;

    return "$month/$day/$year";
  }
}
