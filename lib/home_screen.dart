import 'package:flutter/material.dart';
import 'package:movie_app/colors.dart';
import 'package:movie_app/model/api_services.dart';
import 'package:movie_app/model/movie_list_response.dart';
import 'package:movie_app/widgets/app_bar_widget.dart';
import 'package:movie_app/widgets/movie_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<MovieListResponse> futureMovie;
  final testMovie = const MovieListItem(
    adult: false,
    backdropPath: '/path/to/backdrop.jpg',
    genreIds: [28, 12, 16],
    id: 12345,
    originalTitle: 'Original Title',
    overview: 'This is a sample overview of the movie.',
    popularity: 123.45,
    posterPath:
        "https://image.tmdb.org/t/p/w600_and_h900_bestv2/aosm8NMQ3UyoBVpSxyimorCQykC.jpg",
    releaseDate: '2024',
    title: 'Sample Movie Title',
    voteAverage: 8.5,
    voteCount: 200,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMovie = ApiServices().fetchMovieList(1);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Movies",
        textSize: 16,
        titleColor: textColor,
        backgroundColor: backgroundColor,
        fontWeight: FontWeight.w600,
      ),
      // backgroundColor: primaryColor,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: MovieItemWidget(
                itemHeight: height * 150 / 812, movieListItem: testMovie),
          ),
          // FutureBuilder(
          //     future: futureMovie,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         print(snapshot.data?.movieList[1].toString());
          //         return Text(snapshot.data!.page.toString());
          //       } else if (snapshot.hasError) {
          //         return Text('error');
          //       }

          //       // By default, show a loading spinner.
          //       return const CircularProgressIndicator();
          //     })
        ],
      )),
    );
  }
}
