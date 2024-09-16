class FilmModel {
  FilmModel({
    required this.Title,
    required this.Year,
    required this.Rated,
    required this.Released,
    required this.Runtime,
    required this.Genre,
    required this.Director,
    required this.Writer,
    required this.Actors,
    required this.Plot,
    required this.Language,
    required this.Country,
    required this.Awards,
    required this.Poster,
    required this.Metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbID,
    required this.Type,
    required this.Response,
    required this.Images,
  });
  late final String Title;
  late final String Year;
  late final String Rated;
  late final String Released;
  late final String Runtime;
  late final String Genre;
  late final String Director;
  late final String Writer;
  late final String Actors;
  late final String Plot;
  late final String Language;
  late final String Country;
  late final String Awards;
  late final String Poster;
  late final String Metascore;
  late final String imdbRating;
  late final String imdbVotes;
  late final String imdbID;
  late final String Type;
  late final String Response;
  late final List<String> Images;
  
  FilmModel.fromJson(Map<String, dynamic> json){
    Title = json['Title'];
    Year = json['Year'];
    Rated = json['Rated'];
    Released = json['Released'];
    Runtime = json['Runtime'];
    Genre = json['Genre'];
    Director = json['Director'];
    Writer = json['Writer'];
    Actors = json['Actors'];
    Plot = json['Plot'];
    Language = json['Language'];
    Country = json['Country'];
    Awards = json['Awards'];
    Poster = json['Poster'];
    Metascore = json['Metascore'];
    imdbRating = json['imdbRating'];
    imdbVotes = json['imdbVotes'];
    imdbID = json['imdbID'];
    Type = json['Type'];
    Response = json['Response'];
    Images = List.castFrom<dynamic, String>(json['Images']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Title'] = Title;
    _data['Year'] = Year;
    _data['Rated'] = Rated;
    _data['Released'] = Released;
    _data['Runtime'] = Runtime;
    _data['Genre'] = Genre;
    _data['Director'] = Director;
    _data['Writer'] = Writer;
    _data['Actors'] = Actors;
    _data['Plot'] = Plot;
    _data['Language'] = Language;
    _data['Country'] = Country;
    _data['Awards'] = Awards;
    _data['Poster'] = Poster;
    _data['Metascore'] = Metascore;
    _data['imdbRating'] = imdbRating;
    _data['imdbVotes'] = imdbVotes;
    _data['imdbID'] = imdbID;
    _data['Type'] = Type;
    _data['Response'] = Response;
    _data['Images'] = Images;
    return _data;
  }
}