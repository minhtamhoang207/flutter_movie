import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';

part 'watchlist_state.freezed.dart';

@freezed
class WatchlistState with _$WatchlistState {
  const factory WatchlistState.initial() = Initial;
  const factory WatchlistState.loading() = Loading;
  const factory WatchlistState.loaded(List<Movie> movies) = Loaded;
  const factory WatchlistState.error(String message) = Error;
  const factory WatchlistState.isAdded(bool isAdded) = IsAdded;
}