import 'package:browse_movies/blocs/movie_details/movie_detail_bloc.dart';
import 'package:browse_movies/views/image_gradient_background.dart';
import 'package:browse_movies/views/movie_details_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/movie.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;
  const MovieDetailsPage(
    this.movie, {
    Key? key,
  }) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImagegradientBackground(
            widget.movie.poster,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    child: TextButton(
                      child: const Icon(Icons.arrow_back),
                      style: TextButton.styleFrom(
                        minimumSize: const Size(50, 50),
                        backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      // style: Theme.of(context).textButtonTheme.style?.copyWith(backgroundColor: Colors.white, ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
                      bloc: BlocProvider.of<MovieDetailBloc>(context),
                      builder: (_context, _state) => MovieDetailsView(
                            movieDetails: _state.movieDetails,
                          )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
