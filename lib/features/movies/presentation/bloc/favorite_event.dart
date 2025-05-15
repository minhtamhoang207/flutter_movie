import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_event.freezed.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.addToFavorites(Movie movie) = AddToFavorites;
  const factory FavoriteEvent.removeFromFavorites(Movie movie) = RemoveFromFavorites;
  const factory FavoriteEvent.checkIfAdded(Movie movie) = CheckIfAdded;
}
