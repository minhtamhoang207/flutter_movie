import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

@freezed
// class SearchEvent with _$SearchEvent{
//    const factory SearchEvent.searchMovies(String query) = SearchMovies;
//    const factory SearchEvent.clearSearch() = ClearSearch;
// }



class SearchEvent with _$SearchEvent{
   const factory SearchEvent.searchMovies(String query) = SearchMovies;
   const factory SearchEvent.clearSearch() = ClearSearch;
}