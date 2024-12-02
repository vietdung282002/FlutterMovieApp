import 'package:flutter/material.dart';
import 'package:movie_app/model/data_model/movie_detail_response.dart';
import 'package:movie_app/model/network/api_services.dart';

class MovieDetailViewModel extends ChangeNotifier {
  final ApiServices _apiServices = ApiServices();
  final int movieId;

  MovieItem? _movieItem;
  MovieItem? get movieItem => _movieItem;

  bool _isLoading = false;

  MovieDetailViewModel(this.movieId);
  bool get isLoading => _isLoading;

  Future<void> fetchMovieDetail({bool refresh = false}) async {
    if (refresh) {
      _movieItem = null;
    }

    _isLoading = true;

    try {
      final movieDetailResponse = await _apiServices.fetchMovieDetail(movieId);
      _movieItem = movieDetailResponse;
    } catch (e) {
      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
