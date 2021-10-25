import 'dart:convert';

import 'package:browse_movies/repositories/abstracts/local_db_repository.dart';

import '../abstracts/api_repository.dart';

import '../abstracts/movie_repository.dart';
import '../../models/movie.dart';
import '../../models/movie_details.dart';
import '../../models/search_result.dart';
import '../../sql_constants.dart';

class OMDBMovieRepository extends MovieRepository {
  final APIRepository _apiRepository;
  final LocalDBRepository _localDbRepository;
  final String _apiPath = 'https://omdbapi.com/';
  final String _apiKey = 'apikey=35882e11';

  OMDBMovieRepository(
    this._apiRepository,
    this._localDbRepository,
  ) : super(_apiRepository);

  @override
  Future<MovieDetails> getMovieDetails(String imdbId) async {
    var movieDetailResult = await _localDbRepository.queryTable(
      movieDetailsTablename,
      whereQuery: 'imdbID = ?',
      whereArgs: [imdbId],
    );
    if (movieDetailResult.isNotEmpty) {
      return MovieDetails.fromJson(movieDetailResult.first);
    }

    var responseJson = await _apiRepository.get(
      '$_apiPath/?i=$imdbId',
      _apiKey,
    );

    var jsonDecoded = MovieDetails.trimValidMap(jsonDecode(responseJson));
    await _localDbRepository
        .insertDataTable(movieDetailsTablename, [jsonDecoded]);
    return MovieDetails.fromJson(jsonDecoded);
  }

  @override
  Future<List<Movie>> getSearchResult(String searchQuery) async {
    var responseJson = await _apiRepository.get(
      '$_apiPath/?s=$searchQuery',
      _apiKey,
    );

    var movies = SearchResult.fromJson(jsonDecode(responseJson)).movies;
    _localDbRepository.insertDataTable(
      searchTableName,
      movies.map((e) => e.toJson()).toList(),
      needDeletion: true,
    );
    return movies;
  }

  @override
  Future<List<Movie>> getPreviousSearch() async {
    var moviesList = <Movie>[];
    var result = await _localDbRepository.queryTable(searchTableName);
    for (var element in result) {
      moviesList.add(Movie.fromJson(element));
    }

    return moviesList;
  }
}
