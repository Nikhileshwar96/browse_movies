import 'package:bloc/bloc.dart';
import '../../models/movie.dart';
import '../../repositories/abstracts/movie_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movie_browse_event.dart';
part 'movie_browse_state.dart';

class MovieBrowseBloc extends Bloc<MovieBrowseEvent, MovieBrowseState> {
  final MovieRepository movieRepository;
  MovieBrowseBloc(this.movieRepository) : super(MovieListLoading()) {
    on<LoadInitialMovie>((event, emit) async {
      emit(MovieListLoading());
      var previousMovies = await movieRepository.getPreviousSearch();
      emit(MovieListLoaded(previousMovies));
    });

    on<SearchMovies>((event, emit) async {
      emit(MovieListLoading());
      var movies = await movieRepository.getSearchResult(event.searchQuery);
      emit(MovieListLoaded(movies));
    });
  }
}
