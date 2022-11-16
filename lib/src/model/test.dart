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
    desciption = json['desciption'];
    totalTest = json['total_test'];
    time = json['time'];
    hasDone = json['has_done'];
    currentTest = json['current_test'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desciption'] = this.desciption;
    data['total_test'] = this.totalTest;
    data['time'] = this.time;
    data['has_done'] = this.hasDone;
    data['current_test'] = this.currentTest;
    return data;
  }
}
