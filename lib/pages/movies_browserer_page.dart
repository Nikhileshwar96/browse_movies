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
          children: [
            Container(
              color: Colors.grey,
              child: TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  helperText: 'Search',
                  helperStyle: Theme.of(context).textTheme.bodyText2,
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
                      return const Text('No search made till now');
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
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Loading... loading... loading oh loading since, ${state.toString()}',
                          ),
                          Text(
                            '',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
