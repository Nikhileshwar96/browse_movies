import 'movie.dart';

class SearchResult {
  List<Movie> movies = [];
  bool response = false;
  String failureType = '';

  SearchResult({
    required this.movies,
    required this.response,
    required this.failureType,
  });

  SearchResult.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      movies = <Movie>[];
      json['Search'].forEach((v) {
        movies.add(Movie.fromJson(v));
      });
    }
    if (json['Response'] != null) {
      response = json['Response'].toString().toLowerCase() == 'true';
    }
    if (json['Error'] != null) {
      failureType = json['Error'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Search'] = movies.map((v) => v.toJson()).toList();
    return data;
  }
}
