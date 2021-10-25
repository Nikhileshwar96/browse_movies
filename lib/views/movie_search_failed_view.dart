import 'package:flutter/material.dart';

class MovieSearchFailed extends StatefulWidget {
  const MovieSearchFailed({Key? key}) : super(key: key);

  @override
  _MovieSearchFailedState createState() => _MovieSearchFailedState();
}

class _MovieSearchFailedState extends State<MovieSearchFailed> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Faced an issue, please try again',
      ),
    );
  }
}
