import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/core/config/env_config.dart';
import 'package:flutter_movie/core/di/injection.dart';
import 'package:flutter_movie/features/movies/data/api/movie_api.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/search_event.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieApi _movieApi;

  SearchBloc({MovieApi? movieApi})
      : _movieApi = movieApi ?? getIt<MovieApi>(),
        super(const SearchState.initial()) {
    on<SearchMovies>(
      _onSearchMovies,
    );

    on<ClearSearch>(_onClearSearch);
  }

  Future<void> _onSearchMovies(
      SearchMovies event,
      Emitter<SearchState> emit,
      ) async {
    if (event.query.isEmpty) {
      emit(const SearchState.empty());
      return;
    }

    emit(const SearchState.loading());

    try {
      final response = await _movieApi.getSearchMovies(
        EnvConfig.apiKey,
        event.query,
      );

      if (response.results?.isEmpty ?? true) {
        emit(const SearchState.empty());
      } else {
        emit(SearchState.loaded(response.results!));
      }
    } catch (e) {
      emit(SearchState.error('Failed to search movies: $e'));
    }
  }

  void _onClearSearch(ClearSearch event, Emitter<SearchState> emit) {
    emit(const SearchState.initial());
  }
}
