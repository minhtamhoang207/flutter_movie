import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_movie/features/example/data/models/example_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/examples')
  Future<List<ExampleModel>> getExamples();
}
