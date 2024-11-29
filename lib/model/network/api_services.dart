import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/model/data_model/movie_list_response.dart';
// import 'dart:convert' as json;

import 'api_urls.dart';

class ApiServices {
  Future<MovieListResponse> fetchMovieList(int page) async {
    final response = await http.get(ApiUrls().getMoviesList(page: page));

    if (response.statusCode == 200) {
      return MovieListResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
