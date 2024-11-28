import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final double? textSize;
  final FontWeight? fontWeight;

  const AppBarWidget(
      {super.key,
      required this.title,
      this.titleColor = Colors.black,
      this.backgroundColor = Colors.white,
      this.textSize = 16,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: GoogleFonts.montserrat(
            textStyle: TextStyle(
                color: titleColor, fontSize: textSize, fontWeight: fontWeight)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
