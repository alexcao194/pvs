class User {
  String? id;
  String? displayName;
  String? email;
  int? groupClass;
  String? phoneNumber;
  int? currentLesson;
  int? totalLesson;
  int? state;

  User(
      {this.id,
        this.displayName,
        this.email,
        this.groupClass,
        this.phoneNumber,
        this.currentLesson,
        this.totalLesson,
        this.state});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    email = json['email'];
    groupClass = json['group_class'];
    phoneNumber = json['phone_number'];
    currentLesson = json['current_lesson'];
    totalLesson = json['total_lesson'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['email'] = this.email;
    data['group_class'] = this.groupClass;
    data['phone_number'] = this.phoneNumber;
    data['current_lesson'] = this.currentLesson;
    data['total_lesson'] = this.totalLesson;
    data['state'] = this.state;
    return data;
  }
}