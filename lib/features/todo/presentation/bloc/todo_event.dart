part of 'todo_bloc.dart';

@freezed
class TodoEvent with _$TodoEvent {
  const factory TodoEvent.loadTodos() = _LoadTodos;
  const factory TodoEvent.filterByUserId(int userId) = _FilterByUserId;
}