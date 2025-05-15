import 'package:bloc/bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState.initial()) {
    on<AddToFavorites>(_onAddFavorite);
    on<RemoveFromFavorites>(_onRemoveFavorite);
    on<CheckIfAdded>(_onCheckIfAdded);
  }

  void _onAddFavorite(AddToFavorites event, Emitter<FavoriteState> emit) {
    state.maybeMap(
      loaded: (loadedState) {
        if (!loadedState.movies.any((movie) => movie.id == event.movie.id)) {
          emit(FavoriteState.loaded([...loadedState.movies, event.movie]));
        }
      },
      orElse: () {
        emit(FavoriteState.loaded([event.movie]));
      },
    );
  }

  void _onRemoveFavorite(RemoveFromFavorites event, Emitter<FavoriteState> emit) {
    state.maybeMap(
      loaded: (loadedState) {
        emit(
          FavoriteState.loaded(
            loadedState.movies.where((movie) => movie.id != event.movie.id).toList(),
          ),
        );
      },
      orElse: () {
        emit(const FavoriteState.loaded([]));
      },
    );
  }

  void _onCheckIfAdded(CheckIfAdded event, Emitter<FavoriteState> emit) {
    state.maybeMap(
      loaded: (loadedState) {
        emit(FavoriteState.isAdded(
          loadedState.movies.any((m) => m.id == event.movie.id),
        ),);
      },
      orElse: () {
        emit(const FavoriteState.isAdded(false));
      },
    );
  }
}