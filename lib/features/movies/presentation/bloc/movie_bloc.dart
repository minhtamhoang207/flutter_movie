import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/features/movies/data/repository/movie_repository.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc({required this.movieRepository}) : super(MovieInitial()) {
    on<FetchMovies>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(FetchMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final trending = await movieRepository.getTrendingMovies();
      final popular = await movieRepository.getPopularMovies();
      final nowPlaying = await movieRepository.getNowPlayingMovies();

      emit(MovieLoaded(
        trendingMovies: trending,
        popularMovies: popular,
        nowPlayingMovies: nowPlaying,
      ),);
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
}
