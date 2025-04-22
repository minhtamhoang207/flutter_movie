import 'package:equatable/equatable.dart';

abstract class MovieState extends Equatable
{
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {

}

class MovieLoading extends MovieState {

}

class MovieLoaded extends MovieState {
  final List<String> featuredMovies;
  final List<String> trendingMovies;
  final List<String> newMovies;
  final List<String> genres;

  const MovieLoaded ({
    required this.featuredMovies,
    required this.trendingMovies,
    required this.newMovies,
    required this.genres,
}
);

  @override
  List<Object> get props => [featuredMovies, trendingMovies, newMovies, genres];
}


class MovieError extends MovieState
{
  final String  message;
  const MovieError(this.message);

  @override
  List<Object> get props => [message];
}




class NavigationState extends Equatable
{
  final int currentIndex;
  const NavigationState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}