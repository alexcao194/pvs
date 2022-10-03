class AppTime {
  static String simpleDateFormat(DateTime time) {
    final localTime = time.toLocal();
    return '${localTime.day}/${localTime.month}/${localTime.year}';
  }
}