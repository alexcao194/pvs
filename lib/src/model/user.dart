import 'package:pvs/src/service/local_authentication.dart';

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
    if(avatar!.length > 4) {
      avatar = 'http://${LocalAuthentication.ip4}/avatar/${json['id']}_avatar.jpg';
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['group_class'] = this.groupClass;
    data['background'] = this.background;
    data['phone_number'] = this.phoneNumber;
    data['current_lesson'] = this.currentLesson;
    data['total_lesson'] = this.totalLesson;
    data['state'] = this.state;
    return data;
  }
}