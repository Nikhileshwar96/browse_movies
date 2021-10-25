import 'package:browse_movies/views/movie_not_found_view.dart';
import 'package:browse_movies/views/movie_search_failed_view.dart';
import 'package:browse_movies/views/movie_search_loading.dart';
import 'package:browse_movies/views/no_search_made.dart';
import 'package:browse_movies/views/too_many_results.dart';

import '../blocs/movie_browse_bloc/movie_browse_bloc.dart';
import '../views/movie_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBrowsePage extends StatefulWidget {
  const MovieBrowsePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MovieBrowsePage> createState() => _MovieBrowsePageState();
}

class _MovieBrowsePageState extends State<MovieBrowsePage> {
  TextEditingController searchController = TextEditingController();
  bool isFilterOpen = false;
  String seaarchType = 'All';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Browse',
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFilterOpen = !isFilterOpen;
                    });
                  },
                  icon: const Icon(
                    Icons.filter_list,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            isFilterOpen
                ? Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: seaarchType == 'All',
                            onChanged: (currentState) {
                              setState(() {
                                if (currentState ?? false) {
                                  seaarchType = 'All';
                                }

                                BlocProvider.of<MovieBrowseBloc>(context)
                                    .add(FilterContent(ContentType.all));
                              });
                            },
                          ),
                          const Expanded(
                            child: Text('All'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: seaarchType == 'Movies',
                            onChanged: (currentState) {
                              setState(() {
                                if (currentState ?? false) {
                                  seaarchType = 'Movies';
                                }

                                BlocProvider.of<MovieBrowseBloc>(context)
                                    .add(FilterContent(ContentType.movies));
                              });
                            },
                          ),
                          const Expanded(
                            child: Text('Movies'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: seaarchType == 'Series',
                            onChanged: (currentState) {
                              setState(() {
                                if (currentState ?? false) {
                                  seaarchType = 'Series';
                                }

                                BlocProvider.of<MovieBrowseBloc>(context)
                                    .add(FilterContent(ContentType.series));
                              });
                            },
                          ),
                          const Expanded(
                            child: Text('Series'),
                          ),
                        ],
                      )
                    ],
                  )
                : Text(
                    seaarchType,
                    style: Theme.of(context).textTheme.headline6,
                  ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: const Color(0xFF333333),
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
                controller: searchController,
                onSubmitted: (value) {
                  BlocProvider.of<MovieBrowseBloc>(context)
                      .add(SearchMovies(searchController.text));
                },
                onChanged: (value) {
                  BlocProvider.of<MovieBrowseBloc>(context)
                      .add(SearchMovies(searchController.text));
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<MovieBrowseBloc, MovieBrowseState>(
                builder: (context, state) {
                  if (state is MovieListLoaded) {
                    if (state.movies.isEmpty) {
                      return const NoSearchMade();
                    }
                    return GridView.builder(
                      padding: const EdgeInsets.all(
                        20,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio:
                            (MediaQuery.of(context).size.width / 3) / 300,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: state.movies.length,
                      itemBuilder: (itemContext, index) =>
                          MovieItemView(state.movies[index]),
                    );
                  }

                  if (state is MovieListLoading) {
                    return const MovieSearchLoading();
                  }

                  if (state is MovieListFailed) {
                    switch (state.failureType) {
                      case SearchFailureType.unknown:
                        return searchController.text.isNotEmpty
                            ? const MovieSearchFailed()
                            : const MovieSearchTooManyResults();
                      case SearchFailureType.movieNotFound:
                        return const MovieNotFound();
                      case SearchFailureType.toomanyResults:
                        return const MovieSearchTooManyResults();
                    }
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
