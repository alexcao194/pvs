class User {
  const User({
    required this.id,
    required this.currentLesson,
    required this.displayName,
    required this.email,
    required this.group,
    required this.numberPhone,
    required this.recoveryMail,
    required this.totalLesson
});

  final String displayName;
  final String id;
  final String email;
  final String recoveryMail;
  final String numberPhone;
  final int group;
  final int currentLesson;
  final int totalLesson;

}