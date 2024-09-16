class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.pass,
  });
  late final int id;

  late final String email;
  late final String pass;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['pass'] = pass;
    return _data;
  }
}
