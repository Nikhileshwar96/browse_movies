import 'package:flutter/material.dart';

class ImagegradientBackground extends StatefulWidget {
  final String posterUrl;
  const ImagegradientBackground(this.posterUrl, {Key? key}) : super(key: key);

  @override
  _ImagegradientBackgroundState createState() =>
      _ImagegradientBackgroundState();
}

class _ImagegradientBackgroundState extends State<ImagegradientBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            widget.posterUrl.contains('http')
                ? Image.network(
                    widget.posterUrl,
                    fit: BoxFit.fitWidth,
                  )
                : Image.asset('assets/image_not_available.jpg'),
            Expanded(
              child: Container(),
            ),
          ],
        ),
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.black.withAlpha(80),
                Colors.black.withAlpha(120),
                Colors.black.withAlpha(200),
                Colors.black,
                Colors.black
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
