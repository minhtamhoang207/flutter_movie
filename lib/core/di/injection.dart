import 'package:dio/dio.dart';
import 'package:flutter_movie/core/network/dio_client.dart';
import 'package:flutter_movie/features/movies/data/api/movie_api.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/movie_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_movie/features/todo/data/api/todo_api.dart';
import 'package:flutter_movie/features/todo/data/repositories/todo_repository.dart';
import 'package:flutter_movie/features/todo/presentation/bloc/todo_bloc.dart';

final getIt = GetIt.instance;

class Injection {
  static Future<void> init() async {
    // DioClient
    getIt.registerLazySingleton(
        () => DioClient(baseUrl: 'https://api.themoviedb.org/3'),);

    // Dio
    getIt.registerLazySingleton(() => getIt<DioClient>().dio);

    // API
    getIt.registerLazySingleton(() => TodoApi(getIt()));
    getIt.registerLazySingleton<MovieApi>(() => MovieApi(getIt<Dio>()));

    // Repositories
    getIt.registerLazySingleton(() => TodoRepository(getIt()));

    // BLoCs
    getIt.registerFactory(() => TodoBloc(getIt()));
    getIt.registerFactory<MovieBloc>(() => MovieBloc(getIt()));
  }
}
