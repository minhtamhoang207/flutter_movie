import 'package:flutter_movie/core/network/api_service.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/core/di/injection.dart';
import 'package:flutter_movie/features/movies/data/models/movie_model.dart';

class MovieRepository {
  final ApiService _apiService = ApiService(getIt<DioClient>().dio);

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await _apiService.getTrendingMovies(
          "a7d334a9e6ddb9ac1be335a7e3976f4f",);
      return response.results;
    }
    catch (e)
    {
      throw Exception('Failed to fetch trending movies');
    }

  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await _apiService.getPopularMovies(
          "a7d334a9e6ddb9ac1be335a7e3976f4f",);
      return response.results;
    }
    catch (e)
    {
      throw Exception('Failed to fetch popular movies');
    }
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    try {
      final response = await _apiService.getNowPlayingMovies(
          "a7d334a9e6ddb9ac1be335a7e3976f4f",);
      return response.results;
    }
    catch (e)
    {
      throw Exception('Failed to fetch now playing movies');
    }
  }
}