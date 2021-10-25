part of 'movie_browse_bloc.dart';

@immutable
abstract class MovieBrowseEvent {}

class LoadInitialMovie extends MovieBrowseEvent {}

class LoadMoreMovies extends MovieBrowseEvent {}

class SearchMovies extends MovieBrowseEvent {
  final String searchQuery;
  SearchMovies(
    this.searchQuery,
  );
}
