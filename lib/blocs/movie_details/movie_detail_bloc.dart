import 'package:bloc/bloc.dart';
import 'package:browse_movies/models/movie.dart';
import '../../models/movie_details.dart';
import '../../repositories/abstracts/movie_repository.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository movieRepository;
  MovieDetailBloc(Movie movie, this.movieRepository)
      : super(MovieDetailInitial(mapMovieToMovieDetails(movie))) {
    on<GetMovieDetails>((event, emit) async {
      emit(MovieDetailLoading(mapMovieToMovieDetails(event.movie)));
      var movies = await movieRepository.getMovieDetails(event.movie.imdbID);
      emit(MovieDetailLoaded(movies));
    });
  }

  static MovieDetails mapMovieToMovieDetails(Movie movie) {
    return MovieDetails(
      title: movie.title,
      year: movie.year,
      rated: '',
      released: '',
      runtime: '',
      genre: '',
      director: '',
      writer: '',
      actors: '',
      plot: '',
      poster: '',
      imdbRating: '',
      imdbID: movie.imdbID,
      type: movie.type,
    );
  }
}
