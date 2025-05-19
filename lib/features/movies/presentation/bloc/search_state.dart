
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState{
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded(List<Movie> movies) = _Loaded;
  const factory SearchState.error(String message) = _Error;
  const factory SearchState.empty() = _Empty;
}