import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.g.dart';
part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    int? id,
    String? title,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'vote_average') double? voteAverage,
  }) = _Movie;


  factory Movie.fromJson(Map<String, dynamic> json) =>
      _$MovieFromJson(json);
}


// @freezed
// class Movie with _$Movie{
//   const factory Movie({
//   required int id,
//   required String title,
//   required String overview,
//
//   // @JsonKey(name: 'poster_path') String? posterPath,
//   // @JsonKey(name: 'backdrop_path') String? backdropPath,
//   // @JsonKey(name: 'release_date') String? releaseDate,
//   // @JsonKey(name: 'vote_average') double? voteAverage,
//
// }) = _Movie;
//
//
//   factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
//   // Map<String, dynamic> toJson() => _$MovieToJson(this);
//
//
// }