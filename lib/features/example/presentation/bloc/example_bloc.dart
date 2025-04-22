// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter_movie/features/example/data/models/example_model.dart';
// import 'package:flutter_movie/features/example/data/repositories/example_repository.dart';
//
// part 'example_event.dart';
// part 'example_state.dart';
// part 'example_bloc.freezed.dart';
//
// class ExampleBloc extends Bloc<ExampleEvent, ExampleState> {
//   final ExampleRepository _repository;
//
//   ExampleBloc(this._repository) : super(const ExampleState.initial()) {
//     on<_LoadExamples>(_onLoadExamples);
//   }
//
//   Future<void> _onLoadExamples(
//       _LoadExamples event, Emitter<ExampleState> emit) async {
//     emit(const ExampleState.loading());
//     try {
//       final examples = await _repository.getExamples();
//       emit(ExampleState.loaded(examples));
//     } catch (e) {
//       emit(ExampleState.error(e.toString()));
//     }
//   }
// }
