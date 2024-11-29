class ApiUrls {
  String baseUrls = 'https://api.themoviedb.org/3/movie/';
  final _apiKey = 'a78465ca31af77ddc48dc5e525d629ba';
  Uri getMoviesList({int? page}) {
    baseUrls += 'popular';
    Map<String, String> queryParams = {
      'page': page.toString(),
      'api_key': _apiKey
    };

    return Uri.parse(baseUrls).replace(queryParameters: queryParams);
  }
}
