import 'package:flutter/material.dart';

class NoSearchMade extends StatefulWidget {
  const NoSearchMade({Key? key}) : super(key: key);

  @override
  _NoSearchMadeState createState() => _NoSearchMadeState();
}

class _NoSearchMadeState extends State<NoSearchMade> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.keyboard,
        size: 100,
      ),
    );
  }
}
