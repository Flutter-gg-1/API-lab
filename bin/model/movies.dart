class Movies {
  late final String title;
  late final String description;

  Movies({required this.title, required this.description});

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
