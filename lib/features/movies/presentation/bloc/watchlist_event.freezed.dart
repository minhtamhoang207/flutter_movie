// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watchlist_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WatchlistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Movie movie) add,
    required TResult Function(Movie movie) remove,
    required TResult Function(int movieId) checkIfAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Movie movie)? add,
    TResult? Function(Movie movie)? remove,
    TResult? Function(int movieId)? checkIfAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Movie movie)? add,
    TResult Function(Movie movie)? remove,
    TResult Function(int movieId)? checkIfAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(CheckIfAdded value) checkIfAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(CheckIfAdded value)? checkIfAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(CheckIfAdded value)? checkIfAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistEventCopyWith<$Res> {
  factory $WatchlistEventCopyWith(
          WatchlistEvent value, $Res Function(WatchlistEvent) then) =
      _$WatchlistEventCopyWithImpl<$Res, WatchlistEvent>;
}

/// @nodoc
class _$WatchlistEventCopyWithImpl<$Res, $Val extends WatchlistEvent>
    implements $WatchlistEventCopyWith<$Res> {
  _$WatchlistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadImpl implements Load {
  const _$LoadImpl();

  @override
  String toString() {
    return 'WatchlistEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Movie movie) add,
    required TResult Function(Movie movie) remove,
    required TResult Function(int movieId) checkIfAdded,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Movie movie)? add,
    TResult? Function(Movie movie)? remove,
    TResult? Function(int movieId)? checkIfAdded,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Movie movie)? add,
    TResult Function(Movie movie)? remove,
    TResult Function(int movieId)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(CheckIfAdded value) checkIfAdded,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(CheckIfAdded value)? checkIfAdded,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(CheckIfAdded value)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class Load implements WatchlistEvent {
  const factory Load() = _$LoadImpl;
}

/// @nodoc
abstract class _$$AddImplCopyWith<$Res> {
  factory _$$AddImplCopyWith(_$AddImpl value, $Res Function(_$AddImpl) then) =
      __$$AddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Movie movie});

  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$AddImplCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$AddImpl>
    implements _$$AddImplCopyWith<$Res> {
  __$$AddImplCopyWithImpl(_$AddImpl _value, $Res Function(_$AddImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
  }) {
    return _then(_$AddImpl(
      null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get movie {
    return $MovieCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value));
    });
  }
}

/// @nodoc

class _$AddImpl implements Add {
  const _$AddImpl(this.movie);

  @override
  final Movie movie;

  @override
  String toString() {
    return 'WatchlistEvent.add(movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddImpl &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      __$$AddImplCopyWithImpl<_$AddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Movie movie) add,
    required TResult Function(Movie movie) remove,
    required TResult Function(int movieId) checkIfAdded,
  }) {
    return add(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Movie movie)? add,
    TResult? Function(Movie movie)? remove,
    TResult? Function(int movieId)? checkIfAdded,
  }) {
    return add?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Movie movie)? add,
    TResult Function(Movie movie)? remove,
    TResult Function(int movieId)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(CheckIfAdded value) checkIfAdded,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(CheckIfAdded value)? checkIfAdded,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(CheckIfAdded value)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class Add implements WatchlistEvent {
  const factory Add(final Movie movie) = _$AddImpl;

  Movie get movie;

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddImplCopyWith<_$AddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Movie movie});

  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
  }) {
    return _then(_$RemoveImpl(
      null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get movie {
    return $MovieCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value));
    });
  }
}

/// @nodoc

class _$RemoveImpl implements Remove {
  const _$RemoveImpl(this.movie);

  @override
  final Movie movie;

  @override
  String toString() {
    return 'WatchlistEvent.remove(movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Movie movie) add,
    required TResult Function(Movie movie) remove,
    required TResult Function(int movieId) checkIfAdded,
  }) {
    return remove(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Movie movie)? add,
    TResult? Function(Movie movie)? remove,
    TResult? Function(int movieId)? checkIfAdded,
  }) {
    return remove?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Movie movie)? add,
    TResult Function(Movie movie)? remove,
    TResult Function(int movieId)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(CheckIfAdded value) checkIfAdded,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(CheckIfAdded value)? checkIfAdded,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(CheckIfAdded value)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class Remove implements WatchlistEvent {
  const factory Remove(final Movie movie) = _$RemoveImpl;

  Movie get movie;

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckIfAddedImplCopyWith<$Res> {
  factory _$$CheckIfAddedImplCopyWith(
          _$CheckIfAddedImpl value, $Res Function(_$CheckIfAddedImpl) then) =
      __$$CheckIfAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int movieId});
}

/// @nodoc
class __$$CheckIfAddedImplCopyWithImpl<$Res>
    extends _$WatchlistEventCopyWithImpl<$Res, _$CheckIfAddedImpl>
    implements _$$CheckIfAddedImplCopyWith<$Res> {
  __$$CheckIfAddedImplCopyWithImpl(
      _$CheckIfAddedImpl _value, $Res Function(_$CheckIfAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
  }) {
    return _then(_$CheckIfAddedImpl(
      null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CheckIfAddedImpl implements CheckIfAdded {
  const _$CheckIfAddedImpl(this.movieId);

  @override
  final int movieId;

  @override
  String toString() {
    return 'WatchlistEvent.checkIfAdded(movieId: $movieId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckIfAddedImpl &&
            (identical(other.movieId, movieId) || other.movieId == movieId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieId);

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckIfAddedImplCopyWith<_$CheckIfAddedImpl> get copyWith =>
      __$$CheckIfAddedImplCopyWithImpl<_$CheckIfAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(Movie movie) add,
    required TResult Function(Movie movie) remove,
    required TResult Function(int movieId) checkIfAdded,
  }) {
    return checkIfAdded(movieId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(Movie movie)? add,
    TResult? Function(Movie movie)? remove,
    TResult? Function(int movieId)? checkIfAdded,
  }) {
    return checkIfAdded?.call(movieId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(Movie movie)? add,
    TResult Function(Movie movie)? remove,
    TResult Function(int movieId)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (checkIfAdded != null) {
      return checkIfAdded(movieId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Load value) load,
    required TResult Function(Add value) add,
    required TResult Function(Remove value) remove,
    required TResult Function(CheckIfAdded value) checkIfAdded,
  }) {
    return checkIfAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Load value)? load,
    TResult? Function(Add value)? add,
    TResult? Function(Remove value)? remove,
    TResult? Function(CheckIfAdded value)? checkIfAdded,
  }) {
    return checkIfAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Load value)? load,
    TResult Function(Add value)? add,
    TResult Function(Remove value)? remove,
    TResult Function(CheckIfAdded value)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (checkIfAdded != null) {
      return checkIfAdded(this);
    }
    return orElse();
  }
}

abstract class CheckIfAdded implements WatchlistEvent {
  const factory CheckIfAdded(final int movieId) = _$CheckIfAddedImpl;

  int get movieId;

  /// Create a copy of WatchlistEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckIfAddedImplCopyWith<_$CheckIfAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
