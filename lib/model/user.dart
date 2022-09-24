class User {
  User({
    this.id,
    this.currentLesson,
    this.displayName,
    this.email,
    this.group,
    this.numberPhone,
    this.totalLesson
  });
  User.fromJson(Map<String, dynamic> data) {
    displayName = data['display_name'];
    id = data['id'];
    email = data['email'];
    numberPhone = data['phone_number'];
    group = data['group_class'];
    currentLesson = data['current_lesson'];
    totalLesson = data['total_lesson'];
  }
  String? displayName;
  String? id;
  String? email;
  String? numberPhone;
  int? group;
  int? currentLesson;
  int? totalLesson;

}