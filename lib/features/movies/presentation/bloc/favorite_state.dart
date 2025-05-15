import 'package:flutter_movie/features/movies/data/models/movie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const FavoriteState._();


  const factory FavoriteState.initial() = Initial;
  const factory FavoriteState.loading() = Loading;
  const factory FavoriteState.loaded(List<Movie> movies) = _Loaded;
  const factory FavoriteState.error(String message) = Error;
  const factory FavoriteState.isAdded(bool isAdded) = IsAdded;


  List<Movie> get favorites => maybeMap(
    loaded: (state) => state.movies,
    orElse: () => [],
  );
}