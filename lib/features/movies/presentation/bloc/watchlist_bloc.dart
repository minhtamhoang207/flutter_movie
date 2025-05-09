import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/features/movies/data/repository/watchlist_repository.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/watchlist_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/watchlist_state.dart';


class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final WatchlistRepository _repository;

  WatchlistBloc(this._repository) : super(const WatchlistState.initial()) {
    on<Load>(_onLoad);
    on<Add>(_onAdd);
    on<Remove>(_onRemove);
    on<CheckIfAdded>(_onCheckIfAdded);
  }

  Future<void> _onLoad(Load event, Emitter<WatchlistState> emit) async {
    emit(const WatchlistState.loading());
    try {
      final movies = await _repository.getWatchlist();
      emit(WatchlistState.loaded(movies));
    } catch (e) {
      emit(WatchlistState.error('Failed to load watchlist: ${e.toString()}'));
    }
  }

  Future<void> _onAdd(Add event, Emitter<WatchlistState> emit) async {
    try {
      final currentState = state;
      if (currentState is Loaded) {
        await _repository.addToWatchlist(event.movie);
        final updatedList = [...currentState.movies, event.movie];
        emit(WatchlistState.loaded(updatedList));
        emit(const WatchlistState.isAdded(true));
      }
    } catch (e) {
      emit(WatchlistState.error('Failed to add to watchlist: ${e.toString()}'));
    }
  }

  Future<void> _onRemove(Remove event, Emitter<WatchlistState> emit) async {
    try {
      final currentState = state;
      if (currentState is Loaded) {
        await _repository.removeFromWatchlist(event.movie.id);
        final updatedList = currentState.movies.where((m) => m.id != event.movie.id).toList();
        emit(WatchlistState.loaded(updatedList));
        emit(const WatchlistState.isAdded(false));
      }
    } catch (e) {
      emit(WatchlistState.error('Failed to remove from watchlist: ${e.toString()}'));
    }
  }

  Future<void> _onCheckIfAdded(CheckIfAdded event, Emitter<WatchlistState> emit) async {
    try {
      final isAdded = await _repository.isInWatchlist(event.movieId);
      emit(WatchlistState.isAdded(isAdded));
    } catch (e) {
      emit(WatchlistState.error('Failed to check watchlist status: ${e.toString()}'));
    }
  }
}