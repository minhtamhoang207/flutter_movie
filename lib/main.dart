import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie/core/config/env_config.dart';
import 'package:flutter_movie/core/di/injection.dart';
import 'package:flutter_movie/features/movies/presentation/bloc/favorite_event.dart';
import 'package:flutter_movie/features/movies/presentation/pages/movie_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.init();
  await Injection.init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FavoritesBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Movie App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              useMaterial3: true,
            ),
            home: const MoviePage(),
        ),
    );
    //   MaterialApp(
    //   title: 'Flutter Movie App',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     useMaterial3: true,
    //   ),
    //   home: BlocProvider(
    //     create: (context) => MovieBloc(movieRepository: getIt<MovieRepository>()),
    //     child: const MoviePage(),
    //   ),
    // );
  }
}
