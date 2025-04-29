import 'package:bloc/bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(const FavoritesState([])) {
    on<AddFavorite>(_onAddFavorite);
    on<RemoveFavorite>(_onRemoveFavorite);
  }

  void _onAddFavorite(AddFavorite event, Emitter<FavoritesState> emit) {
    if (!state.favorites.any((movie) => movie.id == event.movie.id)) {
      emit(FavoritesState([...state.favorites, event.movie]));
    }
  }

  void _onRemoveFavorite(RemoveFavorite event, Emitter<FavoritesState> emit) {
    emit(
      FavoritesState(
        state.favorites.where((movie) => movie.id != event.movie.id).toList(),
      ),
    );
  }
}
