import 'package:dio/dio.dart';
import 'package:flutter_movie/features/movies/data/models/base_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/trending/movie/day')
  Future<BaseResponse> getTrendingMovies(
    @Query('api_key') String apiKey,
  );
}
