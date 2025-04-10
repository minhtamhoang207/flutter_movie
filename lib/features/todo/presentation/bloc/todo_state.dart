part of 'todo_bloc.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.initial() = _Initial;
  const factory TodoState.loading() = _Loading;
  const factory TodoState.loaded(List<TodoModel> todos) = _Loaded;
  const factory TodoState.error(String message) = _Error;
}