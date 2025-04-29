import 'package:equatable/equatable.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';

class FavoritesState extends Equatable {
  final List<Movie> favorites;

  const FavoritesState(this.favorites);

  @override
  List<Object> get props => [favorites];
}
