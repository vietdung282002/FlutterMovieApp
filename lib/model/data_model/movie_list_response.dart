class MovieListResponse {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<MovieListItem> movieList;

  const MovieListResponse(
      {required this.page,
      required this.totalPages,
      required this.totalResults,
      required this.movieList});

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('page') &&
        json.containsKey('total_pages') &&
        json.containsKey('total_results') &&
        json.containsKey('results')) {
      return MovieListResponse(
        page: json['page'] as int,
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
        movieList: (json['results'] as List<dynamic>)
            .map((item) => MovieListItem.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } else {
      throw const FormatException('Failed to load movie response.');
    }
  }
}

class MovieListItem {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  const MovieListItem({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  String get formattedVoteAverage => voteAverage.toStringAsFixed(1);

  String get releaseYear {
    return releaseDate.split('-').first;
  }

  factory MovieListItem.fromJson(Map<String, dynamic> json) {
    return MovieListItem(
      id: json['id'] as int,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      backdropPath:
          json['backdrop_path'] != null ? json['backdrop_path'] as String : '',
      releaseDate: json['release_date'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      popularity: (json['popularity'] as num).toDouble(),
      genreIds: List<int>.from(json['genre_ids'] as List),
      adult: json['adult'] as bool,
    );
  }
}
