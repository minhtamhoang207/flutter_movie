import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_event.freezed.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.fetchMovies() = FetchMovies;
  const factory MovieEvent.changeGenre(String genre) = ChangeGenre;
}
