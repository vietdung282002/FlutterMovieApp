import 'package:flutter/material.dart';
import 'package:movie_app/model/api_services.dart';
import 'package:movie_app/model/movie_list_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<MovieListResponse> futureMovie;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMovie = ApiServices().fetchMovieList(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          FutureBuilder(
              future: futureMovie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data?.totalPages);
                  return Text(snapshot.data!.page.toString());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              })
        ],
      )),
    );
  }
}
