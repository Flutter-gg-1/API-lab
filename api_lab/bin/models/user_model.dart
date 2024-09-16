class UserModel {
  final String email;
  final String password;

  UserModel({required this.password, required this.email});

  factory UserModel.fromJson(Map<String,dynamic> json) {
    return UserModel(password: json['password'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email' : email,
      'password' : password
    };
  }
}