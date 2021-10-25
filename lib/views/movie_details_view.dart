import 'dart:ui';

import 'package:browse_movies/models/movie_details.dart';
import 'package:flutter/material.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsView({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        24,
        24,
        24,
        0,
      ),
      padding: const EdgeInsets.all(
        24,
      ),
      decoration: const BoxDecoration(
          color: Color(0xAA000000),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movieDetails.title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_border_outlined,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      movieDetails.imdbRating,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const Icon(
                      Icons.av_timer,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      movieDetails.runtime,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 25,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          movieDetails.type,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: movieDetails.genre.split(', ').length,
                          itemBuilder: (_itemContext, index) => Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              movieDetails.genre.split(', ')[index],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 2,
                  color: Colors.grey.withAlpha(150),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  movieDetails.plot,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text('Director:'),
                    Expanded(
                      child: Text(
                        movieDetails.director,
                        softWrap: true,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Writer: ',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Expanded(
                      child: Text(
                        movieDetails.writer,
                        softWrap: true,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Actors: ',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Expanded(
                      child: Text(
                        movieDetails.actors,
                        softWrap: true,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
