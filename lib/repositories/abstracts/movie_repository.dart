import 'package:browse_movies/models/search_result.dart';

import '../abstracts/api_repository.dart';
import '../../models/movie.dart';
import '../../models/movie_details.dart';

abstract class MovieRepository {
  MovieRepository(APIRepository apiRepository);

  Future<List<Movie>> getPreviousSearch();
  Future<SearchResult> getSearchResult(String searchQuery);
  Future<MovieDetails> getMovieDetails(String imdbId);
}
