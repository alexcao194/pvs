class Account {
  String? id;
  String? pwd;
  String? recoveryEmail;
  int? auth;

  Account({this.id, this.pwd, this.recoveryEmail, this.auth});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pwd = json['pwd'];
    recoveryEmail = json['recovery_email'];
    auth = json['auth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pwd'] = pwd;
    data['recovery_email'] = recoveryEmail;
    data['auth'] = auth;
    return data;
  }
}