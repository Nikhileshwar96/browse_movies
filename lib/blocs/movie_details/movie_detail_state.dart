part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  final MovieDetails movieDetails;
  const MovieDetailState(this.movieDetails);

  @override
  List<Object> get props => [movieDetails];
}

class MovieDetailInitial extends MovieDetailState {
  const MovieDetailInitial(MovieDetails movieDetails) : super(movieDetails);
}

class MovieDetailLoading extends MovieDetailState {
  const MovieDetailLoading(MovieDetails movieDetails) : super(movieDetails);
}

class MovieDetailLoaded extends MovieDetailState {
  const MovieDetailLoaded(MovieDetails movieDetails) : super(movieDetails);
}
