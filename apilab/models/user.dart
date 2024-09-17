class User {
  final String username;
  final String password;
  final String email;

  User({required this.username, required this.password, required this.email});

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
      };
}
