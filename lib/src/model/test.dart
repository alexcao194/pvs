class Test {
  String? name;
  String? desciption;
  int? totalTest;
  int? time;
  bool? hasDone;
  int? currentTest;

  Test(
      {this.name,
        this.desciption,
        this.totalTest,
        this.time,
        this.hasDone,
        this.currentTest});

  Test.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    desciption = json['description'];
    totalTest = json['total_test'];
    time = json['time'];
    hasDone = json['has_done'];
    currentTest = json['current_test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = desciption;
    data['total_test'] = totalTest;
    data['time'] = time;
    data['has_done'] = hasDone;
    data['current_test'] = currentTest;
    return data;
  }
}
