import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_movie/features/todo/data/models/todo_model.dart';
import 'package:flutter_movie/features/todo/data/repositories/todo_repository.dart';

part 'todo_bloc.freezed.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository;

  TodoBloc(this._repository) : super(const TodoState.initial()) {
    on<_LoadTodos>(_onLoadTodos);
    on<_FilterByUserId>(_onFilterByUserId);
  }

  Future<void> _onLoadTodos(_LoadTodos event, Emitter<TodoState> emit) async {
    emit(const TodoState.loading());
    try {
      final todos = await _repository.getTodos();
      emit(TodoState.loaded(todos));
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }

  Future<void> _onFilterByUserId(_FilterByUserId event, Emitter<TodoState> emit) async {
    emit(const TodoState.loading());
    try {
      final todos = await _repository.getTodosByUserId(event.userId);
      emit(TodoState.loaded(todos));
    } catch (e) {
      emit(TodoState.error(e.toString()));
    }
  }
}