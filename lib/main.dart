import 'package:flutter/material.dart';
import 'package:movie_app/view/colors.dart';
import 'package:movie_app/view/home_screen.dart';
import 'package:movie_app/view/movie_detail.dart';
import 'package:movie_app/view_model/movies_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MoviesListViewModel>(
          create: (_) => MoviesListViewModel()..fetchMoviesList(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const HomeScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/detail': (context) => const MovieDetail(),
        },
      ),
    );
  }
}
