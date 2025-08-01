import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.g.dart';
part 'movie_model.freezed.dart';

@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    String? title,
    String? overview,
    List<int>? genreIds,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'vote_average') double? voteAverage,
    String? videoKey,
    bool? isInWatchlist,
  }) = _Movie;
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
