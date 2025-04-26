import 'package:dio/dio.dart';
import 'package:flutter_movie/features/movies/data/models/movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api.g.dart';

@RestApi()
abstract class MovieApi {
  factory MovieApi(Dio dio) = _MovieApi;

  @GET('/trending/movie/day')
  Future<MovieResponse> getTrendingMovies(
    @Query('api_key') String apiKey,
  );

  @GET('/movie/popular')
  Future<MovieResponse> getPopularMovies(
    @Query('api_key') String apiKey,
  );
  @GET('/movie/now_playing')
  Future<MovieResponse> getNowPlayingMovies(
    @Query('api_key') String apiKey,
  );
}
