import 'package:flutter/material.dart';

class MovieSearchTooManyResults extends StatefulWidget {
  const MovieSearchTooManyResults({Key? key}) : super(key: key);

  @override
  _MovieSearchTooManyResultsState createState() =>
      _MovieSearchTooManyResultsState();
}

class _MovieSearchTooManyResultsState extends State<MovieSearchTooManyResults> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Too many results, try filtering.',
      ),
    );
  }
}
