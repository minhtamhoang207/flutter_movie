import 'package:flutter_movie/features/movies/data/models/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.g.dart';
part 'base_response.freezed.dart';

@freezed
class BaseResponse with _$BaseResponse {
  const factory BaseResponse({
    @JsonKey(name: "page")
    required int page,
    @JsonKey(name: "results")
    required List<Movie> results,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}