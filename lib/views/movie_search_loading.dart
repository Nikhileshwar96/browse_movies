import 'package:flutter/material.dart';

class MovieSearchLoading extends StatefulWidget {
  const MovieSearchLoading({Key? key}) : super(key: key);

  @override
  _MovieSearchLoadingState createState() => _MovieSearchLoadingState();
}

class _MovieSearchLoadingState extends State<MovieSearchLoading> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          color: Colors.grey,
        ),
      ),
    );
  }
}
