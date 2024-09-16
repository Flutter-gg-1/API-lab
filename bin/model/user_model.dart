class UserModel {
  UserModel({
    required this.user,
    required this.pass,
  });
  late final String user;
  late final String pass;
  
  UserModel.fromJson(Map<String, dynamic> json){
    user = json['user'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['user'] = user;
    data['pass'] = pass;
    return data;
  }
}