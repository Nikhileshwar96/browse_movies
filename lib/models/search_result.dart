import 'movie.dart';

class SearchResult {
  List<Movie> movies = [];

  SearchResult({required this.movies});

  SearchResult.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      movies = <Movie>[];
      json['Search'].forEach((v) {
        movies.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Search'] = movies.map((v) => v.toJson()).toList();
    return data;
  }
}
