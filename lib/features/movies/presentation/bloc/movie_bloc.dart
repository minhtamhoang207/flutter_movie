import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/features/movies/data/repository/movie_repository.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc({required this.movieRepository})
      : super(const MovieState.initial()) {
    on<FetchMovies>(_onFetchMovies);
  }
  FutureOr<void> _onFetchMovies(
    FetchMovies event,
    Emitter<MovieState> emit,
  ) async {
    emit(const MovieState.loading());

    try {
      final [trending, popular, nowPlaying] = await Future.wait([
        movieRepository.getTrendingMovies(),
        movieRepository.getPopularMovies(),
        movieRepository.getNowPlayingMovies(),
      ]);

      emit(
        MovieState.loaded(
          trendingMovies: trending,
          popularMovies: popular,
          nowPlayingMovies: nowPlaying,
        ),
      );
    } catch (e) {
      emit(MovieState.error(e.toString()));
    }
  }
}
