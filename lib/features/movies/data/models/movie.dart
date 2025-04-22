import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()

class Movie{
  final int id;
  final String title;
  final String overview;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    required this.voteAverage,
});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);


}