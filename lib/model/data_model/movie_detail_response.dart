class MovieItem {
  final bool adult;
  final String? backdropPath;
  final List<GenreItem> genres;
  final int id;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final int runtime;
  final double voteAverage;
  final int voteCount;

  const MovieItem(
      {required this.adult,
      this.backdropPath,
      required this.genres,
      required this.id,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.voteAverage,
      required this.voteCount,
      required this.runtime});

  String get formattedVoteAverage => voteAverage.toStringAsFixed(1);

  String get releaseYear {
    return releaseDate.split('-').first;
  }

  String get formattedRuntime {
    return '$runtime minutes';
  }

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
        id: json['id'] as int,
        title: json['title'] as String,
        originalTitle: json['original_title'] as String,
        overview: json['overview'] as String,
        posterPath: json['poster_path'] as String,
        backdropPath: json['backdrop_path'] as String?,
        releaseDate: json['release_date'] as String,
        voteAverage: (json['vote_average'] as num).toDouble(),
        voteCount: json['vote_count'] as int,
        popularity: (json['popularity'] as num).toDouble(),
        genres: (json['genres'] as List<dynamic>)
            .map((genre) => GenreItem.fromJson(genre as Map<String, dynamic>))
            .toList(),
        adult: json['adult'] as bool,
        runtime: json['runtime'] as int);
  }
}

class GenreItem {
  final int id;
  final String name;

  const GenreItem({required this.id, required this.name});

  factory GenreItem.fromJson(Map<String, dynamic> json) {
    return GenreItem(id: json['id'] as int, name: json['name'] as String);
  }
}
