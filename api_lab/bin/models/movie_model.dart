class MovieModel {
  MovieModel({
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
  
  MovieModel.fromJson(Map<String, dynamic> json){
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
    final data = <String, dynamic>{};
    data['Title'] = Title;
    data['Year'] = Year;
    data['Rated'] = Rated;
    data['Released'] = Released;
    data['Runtime'] = Runtime;
    data['Genre'] = Genre;
    data['Director'] = Director;
    data['Writer'] = Writer;
    data['Actors'] = Actors;
    data['Plot'] = Plot;
    data['Language'] = Language;
    data['Country'] = Country;
    data['Awards'] = Awards;
    data['Poster'] = Poster;
    data['Metascore'] = Metascore;
    data['imdbRating'] = imdbRating;
    data['imdbVotes'] = imdbVotes;
    data['imdbID'] = imdbID;
    data['Type'] = Type;
    data['Response'] = Response;
    data['Images'] = Images;
    return data;
  }
}