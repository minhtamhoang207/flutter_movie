import 'package:flutter_movie/features/movies/data/models/movie_model.dart';

abstract class WatchlistRepository {
  Future<List<Movie>> getWatchlist();
  Future<void> addToWatchlist(Movie movie);
  Future<void> removeFromWatchlist(int movieId);
  Future<bool> isInWatchlist(int movieId);
}

class WatchlistRepositoryImpl implements WatchlistRepository {
  final List<Movie> _watchlist = [];

  @override
  Future<List<Movie>> getWatchlist() async {
    return _watchlist;
  }

  @override
  Future<void> addToWatchlist(Movie movie) async {
    if (!_watchlist.any((m) => m.id == movie.id)) {
      _watchlist.add(movie);
    }
  }

  @override
  Future<void> removeFromWatchlist(int movieId) async {
    _watchlist.removeWhere((movie) => movie.id == movieId);
  }

  @override
  Future<bool> isInWatchlist(int movieId) async {
    return _watchlist.any((movie) => movie.id == movieId);
  }
}