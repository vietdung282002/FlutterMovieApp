import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';
import 'package:movie_app/model/movie_list_response.dart';
import 'package:movie_app/widgets/movie_infor_widget.dart';
import 'package:movie_app/widgets/poster_image_widget.dart';
import 'package:movie_app/widgets/text_widget.dart';

class MovieItemWidget extends StatelessWidget {
  final double itemHeight;
  final MovieListItem movieListItem;
  const MovieItemWidget(
      {super.key, required this.itemHeight, required this.movieListItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      width: double.infinity,
      child: Row(
        children: [
          PosterImageWidget(
            imageUrl: movieListItem.posterPath,
            imageHeight: itemHeight,
            imageWidth: itemHeight * 101 / 120,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: movieListItem.title),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieInforWidget(
                        height: itemHeight * 18 / 120,
                        imageUrl: 'assets/Star.png',
                        content: movieListItem.voteAverage.toString(),
                        color: textColor3,
                      ),
                      MovieInforWidget(
                        height: itemHeight * 18 / 120,
                        imageUrl: 'assets/Ticket.png',
                        content: movieListItem.genreIds.isNotEmpty
                            ? movieListItem.genreIds[0].toString()
                            : 'Unknown Genre',
                        color: textColor2,
                      ),
                      MovieInforWidget(
                        height: itemHeight * 18 / 120,
                        imageUrl: 'assets/CalendarBlank.png',
                        content: movieListItem.releaseDate,
                        color: textColor2,
                      ),
                      MovieInforWidget(
                        height: itemHeight * 18 / 120,
                        imageUrl: 'assets/Clock.png',
                        content: "",
                        color: textColor2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
