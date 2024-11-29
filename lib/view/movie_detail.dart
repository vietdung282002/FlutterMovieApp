import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/view/colors.dart';
import 'package:movie_app/view/widgets/app_bar_widget.dart';
import 'package:movie_app/view/widgets/movie_infor_widget.dart';
import 'package:movie_app/view/widgets/poster_image_widget.dart';
import 'package:movie_app/view/widgets/text_widget.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  final String backdropPath =
      "https://media.themoviedb.org/t/p/w533_and_h300_bestv2/3V4kLQg0kSqPLctI5ziYWabAZYF.jpg";
  final String posterPath =
      "https://image.tmdb.org/t/p/w600_and_h900_bestv2/aosm8NMQ3UyoBVpSxyimorCQykC.jpg";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarWidget(
        leadingWidget: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
        actionWidget: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
              ))
        ],
        title: "Detail",
        backgroundColor: backgroundColor,
        titleColor: textColor,
      ),
      body: SafeArea(
          child: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            height: height * 210 / 812,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  child: Image.network(
                    backdropPath,
                    fit: height > width ? BoxFit.fitHeight : BoxFit.fitWidth,
                    width: width,
                    height: height * 210 / 812,
                  ),
                ),
                Positioned(
                  right: 8,
                  top: height * 210 / 812 - 50,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset("assets/Star.png"),
                    label: Text("9.5",
                        style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: textColor3,
                                fontSize: 12,
                                fontWeight: FontWeight.w600))),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(backgroundColor2),
                        padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.all(0)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ))),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: height * 210 / 812 - 60,
              left: 24,
              child: PosterImageWidget(
                  imageUrl: posterPath, imageHeight: 120, imageWidth: 100)),
          Positioned(
              top: height * 210 / 812 + 8,
              left: 24,
              right: 16,
              bottom: 0,
              child: const Padding(
                padding: EdgeInsets.only(left: 110),
                child: TextWidget(
                  text: "Venom: The Last Dance",
                  textColor: Colors.white,
                  textSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              )),
          Positioned(
              top: height * 210 / 812 + 76,
              left: 24,
              right: 16,
              bottom: 0,
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const MovieInforWidget(
                            height: 16,
                            imageUrl: "assets/CalendarBlank.png",
                            content: "2021"),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Image.asset("assets/Vector.png"),
                        ),
                        const MovieInforWidget(
                            height: 16,
                            imageUrl: "assets/Clock.png",
                            content: "148 Minutes"),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Image.asset("assets/Vector.png"),
                        ),
                        const MovieInforWidget(
                            height: 16,
                            imageUrl: "assets/Ticket.png",
                            content: "Action"),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Expanded(
                    child: TextWidget(
                      text:
                          "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
                      textSize: 12,
                      fontWeight: FontWeight.w400,
                      softWrap: true,
                      textOverflow: TextOverflow.clip,
                    ),
                  )
                ],
              ))
        ],
      )),
    );
  }
}
