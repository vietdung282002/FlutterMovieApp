import 'package:flutter/material.dart';
import 'package:movie_app/view/colors.dart';
import 'package:movie_app/view/screen/home_screen.dart';
import 'package:movie_app/view/screen/movie_detail.dart';
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
          '/': (context) => const HomeScreen(),
          '/detail': (context) => const MovieDetail(),
        },
      ),
    );
  }
}
