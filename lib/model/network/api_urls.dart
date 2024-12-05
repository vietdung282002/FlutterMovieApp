import 'package:movie_app/utils/values.dart';

class ApiUrls {
  Uri getMoviesList({required int page}) {
    Map<String, String> queryParams = {
      'page': page.toString(),
      'api_key': Values.apiKey
    };

    return Uri.parse('${Values.baseUrls}popular')
        .replace(queryParameters: queryParams);
  }

  Uri getMovieDetails({required int movieId}) {
    Map<String, String> queryParams = {'api_key': Values.apiKey};

    return Uri.parse('${Values.baseUrls}$movieId')
        .replace(queryParameters: queryParams);
  }
}
