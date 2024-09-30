import 'package:movies/models/users/trailer_model.dart';

class MovieModel {
  final bool adults;
  final String backdropPath;
  final List genreIds;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final dynamic id;
  final TrailerModel trailerModel;
  MovieModel(
      {required this.adults,
      required this.backdropPath,
      required this.genreIds,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      this.id,required this.trailerModel});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adults: json["adults"] ?? false,
      backdropPath: json["backdrop_path"] ?? '',
      genreIds: List<int>.from(json["genre_ids"] ?? []),
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"] ?? '',
      overview: json["overview"] ?? '',
      popularity: (json["popularity"] ?? 0).toDouble(),
      posterPath: json["poster_path"] ?? '',
      releaseDate: json["release_date"] ?? '',
      title: json["title"] ?? '',
      video: json["video"] ?? false,
      voteAverage: (json["vote_average"] ?? 0).toDouble(),
      voteCount: json["vote_count"] ?? 0,
      id: json["id"] ?? _generateDynamicId(),
        trailerModel: TrailerModel.fromJson(json['trailerModel'] ?? {}),
    );
  }
  static dynamic _generateDynamicId() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
