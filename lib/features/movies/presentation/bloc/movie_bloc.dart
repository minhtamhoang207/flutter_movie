import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_state.dart';
import 'package:flutter_movie/features/movies/data/api/movie_api.dart';
import 'package:flutter_movie/core/config/env_config.dart';



class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieApi apiService;

  MovieBloc(this.apiService) : super(const MovieState.initial()) {
    on<FetchMovies>(_onFetchMovies);
    on<ChangeGenre>(_onChangeGenre);
  }

  Future<void> _onFetchMovies(
      FetchMovies event,
      Emitter<MovieState> emit,
      ) async {
    emit(const MovieState.loading());
    try {
      final trending = await apiService.getTrendingMovies(EnvConfig.apiKey);
      final popular = await apiService.getPopularMovies(EnvConfig.apiKey);
      final nowPlaying = await apiService.getNowPlayingMovies(EnvConfig.apiKey);

      emit(MovieState.loaded(
        trendingMovies: trending.results ?? [],
        popularMovies: popular.results ?? [],
        nowPlayingMovies: nowPlaying.results ?? [],
        selectedGenre: 'All',
      ),);
    } catch (e) {
      emit(MovieState.error('Error fetching movies: $e'));
    }
  }

  void _onChangeGenre(ChangeGenre event, Emitter<MovieState> emit) {
    state.whenOrNull(
      loaded: (trendingMovies, popularMovies, nowPlayingMovies, _) {
        emit(MovieState.loaded(
          trendingMovies: trendingMovies,
          popularMovies: popularMovies,
          nowPlayingMovies: nowPlayingMovies,
          selectedGenre: event.genre,
        ),);
      },
    );
  }
}
