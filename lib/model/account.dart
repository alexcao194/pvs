
class Account {
  Account({this.password, this.id});
  String? id;
  String? password;

  // static invalidId(String id) {
  //   if(
  //       (id.codeUnitAt(0) >= 65 && id.codeUnitAt(0) <= 90)
  //     &&(id.codeUnitAt(0) >= 65 && id.codeUnitAt(0) <= 90)
  //   )
  // }
}