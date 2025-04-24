import 'package:equatable/equatable.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieError extends MovieState {
  final String message;

  const MovieError({required this.message});

  @override
  List<Object> get props => [message];
}

class MovieLoaded extends MovieState {
  final List<Movie> trendingMovies;
  final List<Movie> popularMovies;
  final List<Movie> nowPlayingMovies;


  const MovieLoaded({
    required this.trendingMovies,
    required this.popularMovies,
    required this.nowPlayingMovies,

  });

  MovieLoaded copyWith({
    List<Movie>? trendingMovies,
    List<Movie>? popularMovies,
    List<Movie>? nowPlayingMovies,

  }) {
    return MovieLoaded(
      trendingMovies: trendingMovies ?? this.trendingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,

    );
  }

  @override
  List<Object> get props => [
    trendingMovies,
    popularMovies,
    nowPlayingMovies,

  ];
}