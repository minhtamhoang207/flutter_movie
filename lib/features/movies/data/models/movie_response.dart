import 'package:flutter_movie/features/movies/data/models/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()

class MovieResponse {
  final int page;
  final List<Movie> results;

  @JsonKey(name: 'total_pages') final int totalPages;

  @JsonKey(name: 'total_results') final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
