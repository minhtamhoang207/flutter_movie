import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response.g.dart';
part 'movie_response.freezed.dart';

@freezed
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    int? page,
    List<Movie>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
