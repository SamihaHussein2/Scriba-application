class User {
  late String uid;
  late String name;
  late String email;
  late String password;

  User(this.uid, this.name, this.email, this.password);

  User.fromMap(Map<String, dynamic> data) {
    uid = data['uid'].toString();
    name = data['name'].toString();
    email = data['email'].toString();
    password = data['password'].toString();
  }
}
