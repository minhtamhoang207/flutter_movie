import 'package:dio/dio.dart';
import 'package:flutter_movie/features/movies/data/models/movie_response.dart';
import 'package:flutter_movie/features/movies/data/models/video_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_api.g.dart';

@RestApi()
abstract class MovieApi {
  factory MovieApi(Dio dio) = _MovieApi;

  @GET('/trending/movie/day')
  Future<MovieResponse> getTrendingMovies(
    @Query('api_key') String apiKey,
  );

  @GET('/trending/all/day')
  Future<MovieResponse> getPopularMovies(
    @Query('api_key') String apiKey,
  );
  @GET('/trending/tv/day')
  Future<MovieResponse> getNowPlayingMovies(
    @Query('api_key') String apiKey,
  );

  @GET('/search/movie')
  Future<MovieResponse> getSearchMovies(
    @Query('api_key') String apiKey,
    @Query('query') String query,
  );

  @GET('/movie/{movie_id}/videos')
  Future<VideoResponse> getMovieVideos(
    @Path('movie_id') int movieId,
    @Query('api_key') String apiKey,
  );
}
