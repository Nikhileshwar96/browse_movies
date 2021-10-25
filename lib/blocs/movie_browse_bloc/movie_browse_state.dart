part of 'movie_browse_bloc.dart';

@immutable
abstract class MovieBrowseState extends Equatable {}

class MovieListLoading extends MovieBrowseState {
  @override
  List<Object?> get props => [];
}

class MovieListLoaded extends MovieBrowseState {
  final List<Movie> movies;

  MovieListLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}
