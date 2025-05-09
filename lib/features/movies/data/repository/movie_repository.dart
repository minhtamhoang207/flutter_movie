import 'package:flutter/material.dart';
import 'package:flutter_movie/core/config/env_config.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/core/di/injection.dart';
import 'package:flutter_movie/features/movies/data/api/movie_api.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';

abstract class IMovieRepository {
  Future<List<Movie>> getTrendingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getNowPlayingMovies();

}

class MovieRepository implements IMovieRepository {
  final MovieApi _apiService;

  MovieRepository({required MovieApi apiService}) : _apiService = apiService;

  MovieRepository.internal() : _apiService = MovieApi(getIt<DioClient>().dio);

  @override
  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await _apiService.getTrendingMovies(EnvConfig.apiKey);
      return response.results ?? [];
    } catch (e) {
      debugPrint('Failed to fetch trending movies: $e');
      return [];
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await _apiService.getPopularMovies(EnvConfig.apiKey);
      return response.results ?? [];
    } catch (e) {
      debugPrint('Failed to fetch popular movies: $e');
      return [];
    }
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    try {
      final response = await _apiService.getNowPlayingMovies(EnvConfig.apiKey);
      return response.results ?? [];
    } catch (e) {
      debugPrint('Failed to fetch now playing movies: $e');
      return [];
    }
  }

  Future<String?> fetchMovieVideoKey(int movieId) async {
    try {
      final response = await _apiService.getMovieVideos(movieId, EnvConfig.apiKey);

      final trailer = response.results.firstWhere(
        (video) => video.site == 'YouTube' && video.type == 'Trailer',
        orElse: () => response.results.firstWhere(
          (video) => video.site == 'YouTube',
          orElse: () => throw Exception('No YouTube videos found'),
        ),
      );

      return trailer.key;
    } catch (e) {
      debugPrint('Error fetching video: $e');
      return null;
    }
  }
}
