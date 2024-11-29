import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? fontWeight;
  final bool? softWrap;
  final TextOverflow? textOverflow;
  final int? maxLines;

  const TextWidget({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.textSize = 16,
    this.fontWeight = FontWeight.w400,
    this.softWrap = true,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: textColor, fontSize: textSize, fontWeight: fontWeight)),
      softWrap: softWrap,
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
