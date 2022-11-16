class UserEditFormModel {
  final String? username;
  final String? name;
  final String? email;
  final String? password;

  // constructor
  UserEditFormModel({this.username, this.name, this.email, this.password});

  // function untuk mengubah data ke dalam JSON
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
