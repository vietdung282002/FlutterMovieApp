import 'package:flutter/material.dart';
import 'package:movie_app/model/data_model/movie_list_response.dart';
import 'package:movie_app/model/enum/loading_state.dart';
import 'package:movie_app/model/network/api_services.dart';

class MoviesListViewModel extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  List<MovieListItem> _items = [];
  List<MovieListItem> get items => _items;

  int _currentPage = 1;
  LoadingState _isLoading = LoadingState.idle;

  LoadingState get isLoading => _isLoading;

  Future<void> fetchMoviesList(
      {bool loadMore = false, bool refresh = false}) async {
    if (_isLoading == LoadingState.loading) return;

    if (refresh) {
      _items = [];
      _currentPage = 1;
    } 
    _isLoading = LoadingState.loading;
    
    notifyListeners();

    try {
      final moviesListResponse =
          await _apiServices.fetchMovieList(_currentPage);
      if (moviesListResponse.movieList.isNotEmpty) {
        _items.addAll(moviesListResponse.movieList);
        _currentPage++;
      }
      _isLoading = LoadingState.success;
    } catch (e) {
      _isLoading = LoadingState.failure;
    } finally {
      notifyListeners();
    }
  }
}
