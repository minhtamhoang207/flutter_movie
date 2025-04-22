import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_movie/features/todo/data/models/todo_model.dart';

part 'todo_api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class TodoApi {
  factory TodoApi(Dio dio, {String baseUrl}) = _TodoApi;

  @GET('/todos')
  Future<List<TodoModel>> getTodos();

  @GET('/todos/{id}')
  Future<TodoModel> getTodoById(@Path('id') int id);

  @GET('/todos')
  Future<List<TodoModel>> getTodosByUserId(@Query('userId') int userId);
}