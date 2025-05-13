import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_state.dart';
import 'package:flutter_movie/features/movies/data/api/movie_api.dart';
import 'package:flutter_movie/core/config/env_config.dart';



class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieApi apiService;
  final Map<String, int> genreMap = {
    'Action': 28,
    'Comedy': 35,
    'Drama': 18,
    'Horror': 27,
    'Romance': 10749,
    'Sci-Fi': 878,
    'Thriller': 53,
    'Adventure': 12,
    'Fantasy': 14,
    'Animation': 16,
  };


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
        filteredMovies: trending.results ?? [],
      ),);
    } catch (e) {
      emit(MovieState.error('Error fetching movies: $e'));
    }
  }

  void _onChangeGenre(ChangeGenre event, Emitter<MovieState> emit) {
    state.maybeWhen(
      loaded: (trendingMovies, popularMovies, nowPlayingMovies, _, __) {
          final allMovies = [
            ...trendingMovies,
            ...popularMovies,
            ...nowPlayingMovies,
          ];
          final filteredMovies = event.genre == 'All'
              ? trendingMovies
              : allMovies.where((movie) {
            final genreId = genreMap[event.genre];
            return genreId != null &&
                (movie.genreIds?.contains(genreId) ?? false);
          }).toList();

        emit(MovieState.loaded(
          trendingMovies: trendingMovies,
          popularMovies: popularMovies,
          nowPlayingMovies: nowPlayingMovies,
          selectedGenre: event.genre,
          filteredMovies: filteredMovies,
        ),);
      },
      orElse: (){},
    );
  }
}
