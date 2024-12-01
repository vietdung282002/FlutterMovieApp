import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constain_values/values.dart';
import 'package:movie_app/view/colors.dart';
import 'package:movie_app/view/widgets/app_bar_widget.dart';
import 'package:movie_app/view/widgets/movie_infor_widget.dart';
import 'package:movie_app/view/widgets/poster_image_widget.dart';
import 'package:movie_app/view/widgets/text_widget.dart';
import 'package:movie_app/view_model/movie_detail_view_model.dart';
import 'package:provider/provider.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int movieId = ModalRoute.of(context)?.settings.arguments as int;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => MovieDetailViewModel(movieId)..fetchMovieDetail(),
      child: Consumer<MovieDetailViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.movieItem == null && viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
              title: viewModel.movieItem!.title,
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
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/Placeholder.png',
                            image: viewModel.movieItem?.backdropPath != null
                                ? Values.imageUrl +
                                    Values.imageLarge +
                                    viewModel.movieItem!.backdropPath!
                                : 'assets/Placeholder.png',
                            fit: BoxFit.fitWidth,
                            width: width,
                            height: height * 210 / 812,
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/Placeholder.png',
                                fit: height > width
                                    ? BoxFit.fitHeight
                                    : BoxFit.fitWidth,
                                width: width,
                                height: height * 210 / 812,
                              );
                            },
                          )),
                      Positioned(
                        right: 8,
                        top: height * 210 / 812 - 50,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Image.asset("assets/Star.png"),
                          label: Text(viewModel.movieItem!.formattedVoteAverage,
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
                              shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
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
                        imageUrl: viewModel.movieItem!.posterPath,
                        imageHeight: 120,
                        imageWidth: 100)),
                Positioned(
                    top: height * 210 / 812 + 8,
                    left: 24,
                    right: 16,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: TextWidget(
                        text: viewModel.movieItem!.title,
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
                              MovieInforWidget(
                                  height: 16,
                                  imageUrl: "assets/CalendarBlank.png",
                                  content: viewModel.movieItem!.releaseYear),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Image.asset("assets/Vector.png"),
                              ),
                              MovieInforWidget(
                                  height: 16,
                                  imageUrl: "assets/Clock.png",
                                  content:
                                      viewModel.movieItem!.formattedRuntime),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Image.asset("assets/Vector.png"),
                              ),
                              MovieInforWidget(
                                  height: 16,
                                  imageUrl: "assets/Ticket.png",
                                  content: viewModel.movieItem!.genres[0].name),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          child: TextWidget(
                            text: viewModel.movieItem!.overview,
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
        },
      ),
    );
  }
}
