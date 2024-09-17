class Movie {
  final String title;
  final String director;
  final int year;

  Movie({required this.title, required this.director, required this.year});

  Map<String, dynamic> toJson() => {
        'title': title,
        'director': director,
        'year': year,
      };
}
