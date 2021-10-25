import 'package:bloc/bloc.dart';
import '../../models/movie.dart';
import '../../repositories/abstracts/movie_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movie_browse_event.dart';
part 'movie_browse_state.dart';

class MovieBrowseBloc extends Bloc<MovieBrowseEvent, MovieBrowseState> {
  final MovieRepository movieRepository;
  ContentType contentType = ContentType.all;
  String searchTerm = '';

  MovieBrowseBloc(this.movieRepository) : super(MovieListLoading()) {
    on<LoadInitialMovie>((event, emit) async {
      emit(MovieListLoading());
      var previousMovies = await movieRepository.getPreviousSearch();
      emit(MovieListLoaded(previousMovies, ''));
    });

    on<SearchMovies>(
      (event, emit) async {
        searchTerm = event.searchQuery;
        await searchMovie(emit);
      },
    );

    on<FilterContent>(
      (event, emit) async {
        contentType = event.contentType;
        await searchMovie(emit);
      },
    );
  }

  Future<void> searchMovie(Emitter<MovieBrowseState> emit) async {
    emit(MovieListLoading());
    var typeQuery = getAPITypeQuery();
    var searchResult =
        await movieRepository.getSearchResult('$searchTerm$typeQuery');
    emit(
      searchResult.response
          ? MovieListLoaded(searchResult.movies, searchTerm)
          : MovieListFailed(
              getFailureType(searchResult.failureType),
              searchTerm,
            ),
    );
  }

  String getAPITypeQuery() {
    switch (contentType) {
      case ContentType.all:
        return '';
      case ContentType.movies:
        return '&type=movie';
      case ContentType.series:
        return '&type=series';
    }
  }

  SearchFailureType getFailureType(String failureType) {
    switch (failureType) {
      case 'Movie not found!':
        return SearchFailureType.movieNotFound;
      case 'Too many results.':
        return SearchFailureType.toomanyResults;
      default:
        return SearchFailureType.unknown;
    }
  }
}

enum ContentType {
  movies,
  series,
  all,
}
