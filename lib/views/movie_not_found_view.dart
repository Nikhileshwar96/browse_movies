import 'package:flutter/material.dart';

class MovieNotFound extends StatefulWidget {
  const MovieNotFound({Key? key}) : super(key: key);

  @override
  _MovieNotFoundState createState() => _MovieNotFoundState();
}

class _MovieNotFoundState extends State<MovieNotFound> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Movie not found',
      ),
    );
  }
}
