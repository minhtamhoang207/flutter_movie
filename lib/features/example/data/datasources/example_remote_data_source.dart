// import 'package:dio/dio.dart';
// import 'package:flutter_movie/core/network/api_service.dart';
// import 'package:flutter_movie/features/example/data/models/example_model.dart';
//
// class ExampleRemoteDataSource {
//   final ApiService _apiService;
//
//   ExampleRemoteDataSource(this._apiService);
//
//   Future<List<ExampleModel>> getExamples() async {
//     try {
//       return await _apiService.getExamples();
//     } on DioException catch (e) {
//       throw Exception('Failed to fetch examples: ${e.message}');
//     } catch (e) {
//       throw Exception('Failed to fetch examples: $e');
//     }
//   }
// }
