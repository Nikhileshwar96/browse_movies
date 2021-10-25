import 'package:browse_movies/repositories/abstracts/local_db_repository.dart';
import 'package:browse_movies/repositories/implementations/sqflite_reposiry.dart';

import 'repositories/implementations/http_api_provider.dart';
import 'repositories/abstracts/api_repository.dart';

import 'blocs/movie_browse_bloc/movie_browse_bloc.dart';
import 'repositories/implementations/omdb_movie_repository.dart';
import 'repositories/abstracts/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Pages/movies_browserer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<APIRepository>(
          create: (providerContext) => HttpRepository(),
        ),
        RepositoryProvider<LocalDBRepository>(
            create: (providerContext) => SqfLiteRepository()),
      ],
      child: RepositoryProvider<MovieRepository>(
        create: (movieProviderContext) => OMDBMovieRepository(
          RepositoryProvider.of<APIRepository>(movieProviderContext),
          RepositoryProvider.of<LocalDBRepository>(movieProviderContext),
        ),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: const MaterialColor(0xFF000000, {
                50: Colors.grey,
                100: Colors.grey,
                200: Colors.grey,
                300: Colors.grey,
                400: Colors.grey,
                500: Colors.grey,
                600: Colors.grey,
                700: Colors.grey,
                800: Colors.grey,
                900: Colors.grey
              }),
              unselectedWidgetColor: Colors.grey,
              backgroundColor: Colors.black,
              scaffoldBackgroundColor: Colors.black,
              textTheme: Theme.of(context).textTheme.copyWith(
                    bodyText1: Theme.of(context).textTheme.bodyText1?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                    bodyText2: Theme.of(context).textTheme.bodyText2?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                    subtitle1: Theme.of(context).textTheme.subtitle1?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                    subtitle2: Theme.of(context).textTheme.subtitle2?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                    headline1: Theme.of(context).textTheme.headline1?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                    headline2: Theme.of(context).textTheme.headline2?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                    headline3: Theme.of(context).textTheme.headline3?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                    headline4: Theme.of(context).textTheme.headline4?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                    headline5: Theme.of(context).textTheme.headline5?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                    headline6: Theme.of(context).textTheme.headline6?.copyWith(
                          letterSpacing: 2,
                          color: const Color(0xFFCCCCCC),
                        ),
                  ),
              iconTheme: Theme.of(context).iconTheme.copyWith(
                    color: Colors.white,
                  )),
          home: BlocProvider(
            child: const MovieBrowsePage(),
            create: (_providerContext) => MovieBrowseBloc(
              RepositoryProvider.of<MovieRepository>(_providerContext),
            )..add(LoadInitialMovie()),
          ),
        ),
      ),
    );
  }
}
