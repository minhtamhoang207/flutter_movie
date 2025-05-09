import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';

abstract class WatchlistEvent {}

class AddToWatchlist extends WatchlistEvent {
  final Movie movie;
  AddToWatchlist(this.movie);
}

class RemoveFromWatchlist extends WatchlistEvent {
  final Movie movie;
  RemoveFromWatchlist(this.movie);
}

class LoadWatchlist extends WatchlistEvent {}

class WatchlistState {
  final List<Movie> movies;
  final bool isLoading;

  WatchlistState({required this.movies, this.isLoading = false});
}

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc() : super(WatchlistState(movies: [])) {
    on<AddToWatchlist>(_addToWatchlist);
    on<RemoveFromWatchlist>(_removeFromWatchlist);
    on<LoadWatchlist>(_loadWatchlist);
  }

  void _addToWatchlist(AddToWatchlist event, Emitter<WatchlistState> emit) {
    final updatedMovie = event.movie.copyWith(isInWatchlist: true);
    final updatedList = List<Movie>.from(state.movies)..add(updatedMovie);
    emit(WatchlistState(movies: updatedList));
  }

  void _removeFromWatchlist(
      RemoveFromWatchlist event, Emitter<WatchlistState> emit) {
    final updatedList =
        state.movies.where((m) => m.id != event.movie.id).toList();
    emit(WatchlistState(movies: updatedList));
  }

  void _loadWatchlist(LoadWatchlist event, Emitter<WatchlistState> emit) {
    emit(WatchlistState(movies: state.movies));
  }
}
