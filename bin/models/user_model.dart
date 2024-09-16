class UserModel {
  UserModel({
    required this.id,
    required this.email,
    required this.password,
  });
  late final int id;
  late final String email;
  late final String password;
  
  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}