import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';

part 'watchlist_event.freezed.dart';

@freezed
class WatchlistEvent with _$WatchlistEvent {
  const factory WatchlistEvent.load() = Load;
  const factory WatchlistEvent.add(Movie movie) = Add;
  const factory WatchlistEvent.remove(Movie movie) = Remove;
  const factory WatchlistEvent.checkIfAdded(int movieId) = CheckIfAdded;
}