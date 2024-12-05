import 'package:flutter/material.dart';
import 'package:movie_app/utils/values.dart';

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
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/Placeholder.png',
          image: Values.imageUrl + Values.imageSmall + imageUrl,
          fit: BoxFit.cover,
          width: imageWidth,
          height: imageHeight,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/placeholder.png',
              fit: BoxFit.cover,
              width: imageWidth,
              height: imageWidth,
            );
          },
        ));
  }
}
