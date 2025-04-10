import '../api/todo_api.dart';
import '../models/todo_model.dart';

class TodoRepository {
  final TodoApi _api;

  TodoRepository(this._api);

  Future<List<TodoModel>> getTodos() async {
    try {
      return await _api.getTodos();
    } catch (e) {
      throw Exception('Failed to fetch todos');
    }
  }

  Future<TodoModel> getTodoById(int id) async {
    try {
      return await _api.getTodoById(id);
    } catch (e) {
      throw Exception('Failed to fetch todo');
    }
  }

  Future<List<TodoModel>> getTodosByUserId(int userId) async {
    try {
      return await _api.getTodosByUserId(userId);
    } catch (e) {
      throw Exception('Failed to fetch todos for user');
    }
  }
}