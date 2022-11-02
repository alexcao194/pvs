class User {
  String? id;
  String? displayName;
  String? birthday;
  int? gender;
  String? avatar;
  String? email;
  int? groupClass;
  String? background;
  String? phoneNumber;
  int? currentLesson;
  int? totalLesson;
  int? state;

  User(
      {this.id,
        this.displayName,
        this.birthday,
        this.gender,
        this.avatar,
        this.email,
        this.groupClass,
        this.background,
        this.phoneNumber,
        this.currentLesson,
        this.totalLesson,
        this.state});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    birthday = json['birthday'];
    gender = json['gender'];
    avatar = json['avatar'];
    email = json['email'];
    groupClass = json['group_class'];
    background = json['background'];
    phoneNumber = json['phone_number'];
    currentLesson = json['current_lesson'];
    totalLesson = json['total_lesson'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display_name'] = displayName;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['avatar'] = avatar;
    data['email'] = email;
    data['group_class'] = groupClass;
    data['background'] = background;
    data['phone_number'] = phoneNumber;
    data['current_lesson'] = currentLesson;
    data['total_lesson'] = totalLesson;
    data['state'] = state;
    return data;
  }
}