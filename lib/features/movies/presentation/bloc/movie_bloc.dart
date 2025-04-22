
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/core/network/api_service.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState>
{
  final ApiService apiService;

  MovieBloc({ required this.apiService }) : super (MovieInitial())
  {
    on<FetchMovies>(_onFetchMovies);
  }

  Future<void> _onFetchMovies(FetchMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());

    try
        {
          final featuredMovies = [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsD-naLZVYTj25Ra8-pSQFLoPEtbEtvjGzQ&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8RVVOlllmjxYh_HLxrV4w58DGpmxQt1URg&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFF0BW_56nfhWiPwEohlSewF7QdqEiIE90OA&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBqs1ma9yYGUAECqYKpl-Pza1LPJOEAo52w&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsRbSnyqlS1qHLiMBQNBLY0aLEG1SOboAWRg&s',
          ];

          final trendingMovies = [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsRbSnyqlS1qHLiMBQNBLY0aLEG1SOboAWRg&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFF0BW_56nfhWiPwEohlSewF7QdqEiIE90OA&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBqs1ma9yYGUAECqYKpl-Pza1LPJOEAo52w&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsD-naLZVYTj25Ra8-pSQFLoPEtbEtvjGzQ&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8RVVOlllmjxYh_HLxrV4w58DGpmxQt1URg&s',
          ];

          final newMovies = [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsRbSnyqlS1qHLiMBQNBLY0aLEG1SOboAWRg&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFF0BW_56nfhWiPwEohlSewF7QdqEiIE90OA&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIBqs1ma9yYGUAECqYKpl-Pza1LPJOEAo52w&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAsD-naLZVYTj25Ra8-pSQFLoPEtbEtvjGzQ&s',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-8RVVOlllmjxYh_HLxrV4w58DGpmxQt1URg&s',
          ];

          final genres = [
            'Action',
            'Comedy',
            'Drama',
            'Horror',
            'Romance',
            'Sci-Fi',
            'Thriller',
            'Adventure',
            'Fantasy',
            'Animation',
          ];

          emit(MovieLoaded(
              featuredMovies: featuredMovies,
              trendingMovies: trendingMovies,
              newMovies: newMovies,
              genres: genres,
          ),);
        }
        catch (e)
    {
      emit(MovieError('Failed to fetch movies: $e'));
    }
  }
}




class NavigationBloc extends Bloc<NavigationEvent, NavigationState>
{
  NavigationBloc() : super(const NavigationState(0))
      {
        on<NavigationChanged> (_onNavigationChanged);
      }

      void _onNavigationChanged (
      NavigationChanged event, Emitter<NavigationState> emit,)
  {
    emit(NavigationState(event.index));
  }
}