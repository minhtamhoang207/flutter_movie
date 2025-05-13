import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';

part 'movie_state.freezed.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState.initial() = _Initial;
  const factory MovieState.loading() = _Loading;
  const factory MovieState.loaded({
    required List<Movie> trendingMovies,
    required List<Movie> popularMovies,
    required List<Movie> nowPlayingMovies,
    required String selectedGenre,
    required List<Movie> filteredMovies,
  }) = _Loaded;
  const factory MovieState.error(String message) = _Error;
}
