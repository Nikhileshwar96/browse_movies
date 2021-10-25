part of 'movie_browse_bloc.dart';

@immutable
abstract class MovieBrowseState extends Equatable {}

class MovieListLoading extends MovieBrowseState {
  @override
  List<Object?> get props => [];
}

class MovieListLoaded extends MovieBrowseState {
  final List<Movie> movies;
  final String searchQuery;

  MovieListLoaded(
    this.movies,
    this.searchQuery,
  );

  @override
  List<Object?> get props => [
        movies,
        searchQuery,
      ];
}

class MovieListFailed extends MovieBrowseState {
  final SearchFailureType failureType;
  final String searchQuery;

  MovieListFailed(
    this.failureType,
    this.searchQuery,
  );

  @override
  List<Object?> get props => [
        failureType,
        searchQuery,
      ];
}

enum SearchFailureType {
  toomanyResults,
  movieNotFound,
  unknown,
}
