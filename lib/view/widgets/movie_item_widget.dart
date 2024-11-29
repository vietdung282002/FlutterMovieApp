import 'package:flutter/material.dart';
import 'package:movie_app/view/colors.dart';
import 'package:movie_app/model/data_model/movie_list_response.dart';
import 'package:movie_app/view/widgets/movie_infor_widget.dart';
import 'package:movie_app/view/widgets/poster_image_widget.dart';
import 'package:movie_app/view/widgets/text_widget.dart';

class MovieItemWidget extends StatelessWidget {
  final double itemHeight;
  final MovieListItem movieListItem;
  const MovieItemWidget(
      {super.key, required this.itemHeight, required this.movieListItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: SizedBox(
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
                    TextWidget(
                      text: movieListItem.title,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
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
      ),
    );
  }
}
