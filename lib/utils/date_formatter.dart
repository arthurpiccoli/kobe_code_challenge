extension DateFormatter on DateTime {
  String toShortDateString() {
    return "$month/$day/$year";
  }
}
