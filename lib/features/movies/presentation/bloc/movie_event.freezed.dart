// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchMovies,
    required TResult Function(String genre) changeGenre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchMovies,
    TResult? Function(String genre)? changeGenre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchMovies,
    TResult Function(String genre)? changeGenre,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMovies value) fetchMovies,
    required TResult Function(ChangeGenre value) changeGenre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMovies value)? fetchMovies,
    TResult? Function(ChangeGenre value)? changeGenre,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovies value)? fetchMovies,
    TResult Function(ChangeGenre value)? changeGenre,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieEventCopyWith<$Res> {
  factory $MovieEventCopyWith(
          MovieEvent value, $Res Function(MovieEvent) then) =
      _$MovieEventCopyWithImpl<$Res, MovieEvent>;
}

/// @nodoc
class _$MovieEventCopyWithImpl<$Res, $Val extends MovieEvent>
    implements $MovieEventCopyWith<$Res> {
  _$MovieEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchMoviesImplCopyWith<$Res> {
  factory _$$FetchMoviesImplCopyWith(
          _$FetchMoviesImpl value, $Res Function(_$FetchMoviesImpl) then) =
      __$$FetchMoviesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchMoviesImplCopyWithImpl<$Res>
    extends _$MovieEventCopyWithImpl<$Res, _$FetchMoviesImpl>
    implements _$$FetchMoviesImplCopyWith<$Res> {
  __$$FetchMoviesImplCopyWithImpl(
      _$FetchMoviesImpl _value, $Res Function(_$FetchMoviesImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchMoviesImpl implements FetchMovies {
  const _$FetchMoviesImpl();

  @override
  String toString() {
    return 'MovieEvent.fetchMovies()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchMoviesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchMovies,
    required TResult Function(String genre) changeGenre,
  }) {
    return fetchMovies();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchMovies,
    TResult? Function(String genre)? changeGenre,
  }) {
    return fetchMovies?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchMovies,
    TResult Function(String genre)? changeGenre,
    required TResult orElse(),
  }) {
    if (fetchMovies != null) {
      return fetchMovies();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMovies value) fetchMovies,
    required TResult Function(ChangeGenre value) changeGenre,
  }) {
    return fetchMovies(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMovies value)? fetchMovies,
    TResult? Function(ChangeGenre value)? changeGenre,
  }) {
    return fetchMovies?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovies value)? fetchMovies,
    TResult Function(ChangeGenre value)? changeGenre,
    required TResult orElse(),
  }) {
    if (fetchMovies != null) {
      return fetchMovies(this);
    }
    return orElse();
  }
}

abstract class FetchMovies implements MovieEvent {
  const factory FetchMovies() = _$FetchMoviesImpl;
}

/// @nodoc
abstract class _$$ChangeGenreImplCopyWith<$Res> {
  factory _$$ChangeGenreImplCopyWith(
          _$ChangeGenreImpl value, $Res Function(_$ChangeGenreImpl) then) =
      __$$ChangeGenreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String genre});
}

/// @nodoc
class __$$ChangeGenreImplCopyWithImpl<$Res>
    extends _$MovieEventCopyWithImpl<$Res, _$ChangeGenreImpl>
    implements _$$ChangeGenreImplCopyWith<$Res> {
  __$$ChangeGenreImplCopyWithImpl(
      _$ChangeGenreImpl _value, $Res Function(_$ChangeGenreImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genre = null,
  }) {
    return _then(_$ChangeGenreImpl(
      null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeGenreImpl implements ChangeGenre {
  const _$ChangeGenreImpl(this.genre);

  @override
  final String genre;

  @override
  String toString() {
    return 'MovieEvent.changeGenre(genre: $genre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeGenreImpl &&
            (identical(other.genre, genre) || other.genre == genre));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genre);

  /// Create a copy of MovieEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeGenreImplCopyWith<_$ChangeGenreImpl> get copyWith =>
      __$$ChangeGenreImplCopyWithImpl<_$ChangeGenreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchMovies,
    required TResult Function(String genre) changeGenre,
  }) {
    return changeGenre(genre);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchMovies,
    TResult? Function(String genre)? changeGenre,
  }) {
    return changeGenre?.call(genre);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchMovies,
    TResult Function(String genre)? changeGenre,
    required TResult orElse(),
  }) {
    if (changeGenre != null) {
      return changeGenre(genre);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMovies value) fetchMovies,
    required TResult Function(ChangeGenre value) changeGenre,
  }) {
    return changeGenre(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMovies value)? fetchMovies,
    TResult? Function(ChangeGenre value)? changeGenre,
  }) {
    return changeGenre?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMovies value)? fetchMovies,
    TResult Function(ChangeGenre value)? changeGenre,
    required TResult orElse(),
  }) {
    if (changeGenre != null) {
      return changeGenre(this);
    }
    return orElse();
  }
}

abstract class ChangeGenre implements MovieEvent {
  const factory ChangeGenre(final String genre) = _$ChangeGenreImpl;

  String get genre;

  /// Create a copy of MovieEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChangeGenreImplCopyWith<_$ChangeGenreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
