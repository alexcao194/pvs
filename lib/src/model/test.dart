class Test {
  String? name;
  String? desciption;
  int? totalTest;
  int? time;
  bool? hasDone;

  Test({this.name, this.desciption, this.totalTest, this.time, this.hasDone});

  Test.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desciption = json['desciption'];
    totalTest = json['total_test'];
    time = json['time'];
    hasDone = json['has_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['desciption'] = desciption;
    data['total_test'] = totalTest;
    data['time'] = time;
    data['has_done'] = hasDone;
    return data;
  }
}
