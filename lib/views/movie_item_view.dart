import 'package:browse_movies/blocs/movie_details/movie_detail_bloc.dart';
import 'package:browse_movies/repositories/abstracts/movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/movie.dart';
import '../pages/movie_details_page.dart';
import 'package:flutter/material.dart';

class MovieItemView extends StatelessWidget {
  final Movie movie;
  const MovieItemView(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Image.network(
              movie.poster,
              fit: BoxFit.fill,
            ),
            clipBehavior: Clip.hardEdge,
          ),
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
              Text(
                movie.year,
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_context) => BlocProvider(
              create: (_blocContext) => MovieDetailBloc(
                movie,
                RepositoryProvider.of<MovieRepository>(context),
              )..add(GetMovieDetails(movie)),
              child: MovieDetailsPage(
                movie,
              ),
            ),
            fullscreenDialog: true,
          ),
        );
      },
    );
  }
}
