class MovieDetails {
  String title = '';
  String year = '';
  String rated = '';
  String released = '';
  String runtime = '';
  String genre = '';
  String director = '';
  String writer = '';
  String actors = '';
  String plot = '';
  String poster = '';
  String metascore = '';
  String imdbRating = '';
  String imdbID = '';
  String type = '';

  static const supportedKeys = [
    'Title',
    'Year',
    'Rated',
    'Released',
    'Runtime',
    'Genre',
    'Director',
    'Writer',
    'Actors',
    'Plot',
    'Poster',
    'imdbRating',
    'imdbID',
    'Type',
  ];

  MovieDetails({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.poster,
    required this.imdbRating,
    required this.imdbID,
    required this.type,
  });

  MovieDetails.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    rated = json['Rated'] ?? '';
    released = json['Released'] ?? '';
    runtime = json['Runtime'] ?? '';
    genre = json['Genre'] ?? '';
    director = json['Director'] ?? '';
    writer = json['Writer'] ?? '';
    actors = json['Actors'] ?? '';
    plot = json['Plot'] ?? '';
    poster = json['Poster'] ?? '';
    metascore = json['Metascore'] ?? '';
    imdbRating = json['imdbRating'] ?? '';
    imdbID = json['imdbID'] ?? '';
    type = json['Type'] ?? '';
  }

  static Map<String, dynamic> trimValidMap(Map<String, dynamic> rawMap) {
    var referenceMap = Map<String, dynamic>.from(rawMap);
    referenceMap.removeWhere((key, value) => !supportedKeys.contains(key));
    return referenceMap;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Year'] = year;
    data['Rated'] = rated;
    data['Released'] = released;
    data['Runtime'] = runtime;
    data['Genre'] = genre;
    data['Director'] = director;
    data['Writer'] = writer;
    data['Actors'] = actors;
    data['Plot'] = plot;
    data['Poster'] = poster;
    data['Metascore'] = metascore;
    data['imdbRating'] = imdbRating;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    return data;
  }
}
