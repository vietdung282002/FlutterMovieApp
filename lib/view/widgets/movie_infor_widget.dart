import 'package:flutter/material.dart';
import 'package:movie_app/view/colors.dart';
import 'package:movie_app/view/widgets/text_widget.dart';

class MovieInforWidget extends StatelessWidget {
  final double height;
  final String imageUrl;
  final String content;
  final Color? color;

  const MovieInforWidget(
      {super.key,
      required this.height,
      required this.imageUrl,
      required this.content,
      this.color = textColor2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(imageUrl)),
          const SizedBox(
            width: 5,
          ),
          TextWidget(
            text: content,
            textColor: color,
            textSize: 12,
            fontWeight: FontWeight.w400,
          ),
          Container(
            color: Colors.cyan,
          )
        ],
      ),
    );
  }
}
