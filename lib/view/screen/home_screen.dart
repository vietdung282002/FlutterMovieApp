import 'package:flutter/material.dart';
import 'package:movie_app/model/enum/loading_state.dart';
import 'package:movie_app/view/colors.dart';
import 'package:movie_app/view/widgets/alert_dialog_widget.dart';
import 'package:movie_app/view/widgets/app_bar_widget.dart';
import 'package:movie_app/view/widgets/movie_item_widget.dart';
import 'package:movie_app/view_model/movies_list_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Provider.of<MoviesListViewModel>(context, listen: false)
            .fetchMoviesList(loadMore: true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
      body: Consumer<MoviesListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.items.isEmpty &&
              viewModel.isLoading == LoadingState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (viewModel.isLoading == LoadingState.failure) {
            return AlertDialogWidget(
              content: "Fail to load movie list",
              onTap: () {
                Provider.of<MoviesListViewModel>(context, listen: false)
                    .fetchMoviesList(loadMore: false);
              },
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              await viewModel.fetchMoviesList(refresh: true);
            },
            child: ListView.builder(
              itemCount: viewModel.items.length +
                  (viewModel.isLoading == LoadingState.loading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < viewModel.items.length) {
                  final item = viewModel.items[index];
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 12, bottom: 12),
                    child: MovieItemWidget(
                        itemHeight: height * 120 / 812, movieListItem: item),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              controller: _scrollController,
            ),
          );
        },
      ),
    );
  }
}
