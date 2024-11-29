import 'package:flutter/material.dart';
import 'package:movie_app/model/data_model/movie_list_response.dart';
import 'package:movie_app/model/network/api_services.dart';

class MoviesListViewModel extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  List<MovieListItem> _items = [];
  List<MovieListItem> get items => _items;

  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  bool get isLoading => _isLoading;

  Future<void> fetchMoviesList(
      {bool loadMore = false, bool refresh = false}) async {
    print(loadMore && !_hasMore);
    if (_isLoading) return;

    if (refresh) {
      _items = [];
      _currentPage = 1;
      _hasMore = true;
    }

    if (loadMore && !_hasMore) return;

    _isLoading = true;
    notifyListeners();

    try {
      final fetchedMovies = await _apiServices.fetchMovieList(_currentPage);
      if (fetchedMovies.movieList.isEmpty) {
        _hasMore = false;
      } else {
        _items.addAll(fetchedMovies.movieList);
        _currentPage++;
      }
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
