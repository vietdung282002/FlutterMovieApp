import 'package:flutter/material.dart';
import 'package:movie_app/model/data_model/movie_detail_response.dart';
import 'package:movie_app/model/enum/loading_state.dart';
import 'package:movie_app/model/network/api_services.dart';

class MovieDetailViewModel extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();

  MovieItem? _movieItem;
  MovieItem? get movieItem => _movieItem;

  LoadingState _isLoading = LoadingState.idle;
  LoadingState get isLoading => _isLoading;

  Future<void> fetchMovieDetail(int movieId, {bool refresh = false}) async {
    if (_isLoading == LoadingState.loading) return;
    if (refresh) {
      _movieItem = null;
    }

    _isLoading = LoadingState.loading;

    try {
      final movieDetailResponse = await _apiServices.fetchMovieDetail(movieId);
      _movieItem = movieDetailResponse;
      _isLoading = LoadingState.success;
    } catch (e) {
      _isLoading = LoadingState.failure;
    } finally {
      notifyListeners();
    }
  }
}
