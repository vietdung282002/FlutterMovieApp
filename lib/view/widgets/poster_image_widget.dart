import 'package:flutter/material.dart';

class PosterImageWidget extends StatelessWidget {
  final String imageUrl;
  final double borderRadius;
  final double imageHeight;
  final double imageWidth;

  const PosterImageWidget(
      {super.key,
      required this.imageUrl,
      this.borderRadius = 16,
      required this.imageHeight,
      required this.imageWidth});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.network(
          "https://image.tmdb.org/t/p/w600_and_h900_bestv2$imageUrl",
          fit: BoxFit.cover,
          width: imageWidth,
          height: imageHeight,
        ));
  }
}
