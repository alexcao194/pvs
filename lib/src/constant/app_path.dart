class AppPath {
  static String profile = 'assets/icons/profile.png';
  static String a2Background = 'assets/background/a2_background.png';
  static String logo = 'assets/icons/logo.png';

  static toActive(String path) {
    return path.replaceAll('.png', '_active.png');
  }
}