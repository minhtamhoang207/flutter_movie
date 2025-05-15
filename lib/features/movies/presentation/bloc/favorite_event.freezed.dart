// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteEvent {
  Movie get movie => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie) addToFavorites,
    required TResult Function(Movie movie) removeFromFavorites,
    required TResult Function(Movie movie) checkIfAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie)? addToFavorites,
    TResult? Function(Movie movie)? removeFromFavorites,
    TResult? Function(Movie movie)? checkIfAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie)? addToFavorites,
    TResult Function(Movie movie)? removeFromFavorites,
    TResult Function(Movie movie)? checkIfAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToFavorites value) addToFavorites,
    required TResult Function(RemoveFromFavorites value) removeFromFavorites,
    required TResult Function(CheckIfAdded value) checkIfAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToFavorites value)? addToFavorites,
    TResult? Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult? Function(CheckIfAdded value)? checkIfAdded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToFavorites value)? addToFavorites,
    TResult Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult Function(CheckIfAdded value)? checkIfAdded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteEventCopyWith<FavoriteEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteEventCopyWith<$Res> {
  factory $FavoriteEventCopyWith(
          FavoriteEvent value, $Res Function(FavoriteEvent) then) =
      _$FavoriteEventCopyWithImpl<$Res, FavoriteEvent>;
  @useResult
  $Res call({Movie movie});

  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class _$FavoriteEventCopyWithImpl<$Res, $Val extends FavoriteEvent>
    implements $FavoriteEventCopyWith<$Res> {
  _$FavoriteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
  }) {
    return _then(_value.copyWith(
      movie: null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ) as $Val);
  }

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get movie {
    return $MovieCopyWith<$Res>(_value.movie, (value) {
      return _then(_value.copyWith(movie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddToFavoritesImplCopyWith<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  factory _$$AddToFavoritesImplCopyWith(_$AddToFavoritesImpl value,
          $Res Function(_$AddToFavoritesImpl) then) =
      __$$AddToFavoritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Movie movie});

  @override
  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$AddToFavoritesImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$AddToFavoritesImpl>
    implements _$$AddToFavoritesImplCopyWith<$Res> {
  __$$AddToFavoritesImplCopyWithImpl(
      _$AddToFavoritesImpl _value, $Res Function(_$AddToFavoritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
  }) {
    return _then(_$AddToFavoritesImpl(
      null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }
}

/// @nodoc

class _$AddToFavoritesImpl implements AddToFavorites {
  const _$AddToFavoritesImpl(this.movie);

  @override
  final Movie movie;

  @override
  String toString() {
    return 'FavoriteEvent.addToFavorites(movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToFavoritesImpl &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToFavoritesImplCopyWith<_$AddToFavoritesImpl> get copyWith =>
      __$$AddToFavoritesImplCopyWithImpl<_$AddToFavoritesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie) addToFavorites,
    required TResult Function(Movie movie) removeFromFavorites,
    required TResult Function(Movie movie) checkIfAdded,
  }) {
    return addToFavorites(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie)? addToFavorites,
    TResult? Function(Movie movie)? removeFromFavorites,
    TResult? Function(Movie movie)? checkIfAdded,
  }) {
    return addToFavorites?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie)? addToFavorites,
    TResult Function(Movie movie)? removeFromFavorites,
    TResult Function(Movie movie)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (addToFavorites != null) {
      return addToFavorites(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToFavorites value) addToFavorites,
    required TResult Function(RemoveFromFavorites value) removeFromFavorites,
    required TResult Function(CheckIfAdded value) checkIfAdded,
  }) {
    return addToFavorites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToFavorites value)? addToFavorites,
    TResult? Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult? Function(CheckIfAdded value)? checkIfAdded,
  }) {
    return addToFavorites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToFavorites value)? addToFavorites,
    TResult Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult Function(CheckIfAdded value)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (addToFavorites != null) {
      return addToFavorites(this);
    }
    return orElse();
  }
}

abstract class AddToFavorites implements FavoriteEvent {
  const factory AddToFavorites(final Movie movie) = _$AddToFavoritesImpl;

  @override
  Movie get movie;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddToFavoritesImplCopyWith<_$AddToFavoritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromFavoritesImplCopyWith<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  factory _$$RemoveFromFavoritesImplCopyWith(_$RemoveFromFavoritesImpl value,
          $Res Function(_$RemoveFromFavoritesImpl) then) =
      __$$RemoveFromFavoritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Movie movie});

  @override
  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$RemoveFromFavoritesImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$RemoveFromFavoritesImpl>
    implements _$$RemoveFromFavoritesImplCopyWith<$Res> {
  __$$RemoveFromFavoritesImplCopyWithImpl(_$RemoveFromFavoritesImpl _value,
      $Res Function(_$RemoveFromFavoritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
  }) {
    return _then(_$RemoveFromFavoritesImpl(
      null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }
}

/// @nodoc

class _$RemoveFromFavoritesImpl implements RemoveFromFavorites {
  const _$RemoveFromFavoritesImpl(this.movie);

  @override
  final Movie movie;

  @override
  String toString() {
    return 'FavoriteEvent.removeFromFavorites(movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromFavoritesImpl &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromFavoritesImplCopyWith<_$RemoveFromFavoritesImpl> get copyWith =>
      __$$RemoveFromFavoritesImplCopyWithImpl<_$RemoveFromFavoritesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie) addToFavorites,
    required TResult Function(Movie movie) removeFromFavorites,
    required TResult Function(Movie movie) checkIfAdded,
  }) {
    return removeFromFavorites(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie)? addToFavorites,
    TResult? Function(Movie movie)? removeFromFavorites,
    TResult? Function(Movie movie)? checkIfAdded,
  }) {
    return removeFromFavorites?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie)? addToFavorites,
    TResult Function(Movie movie)? removeFromFavorites,
    TResult Function(Movie movie)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (removeFromFavorites != null) {
      return removeFromFavorites(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToFavorites value) addToFavorites,
    required TResult Function(RemoveFromFavorites value) removeFromFavorites,
    required TResult Function(CheckIfAdded value) checkIfAdded,
  }) {
    return removeFromFavorites(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToFavorites value)? addToFavorites,
    TResult? Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult? Function(CheckIfAdded value)? checkIfAdded,
  }) {
    return removeFromFavorites?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToFavorites value)? addToFavorites,
    TResult Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult Function(CheckIfAdded value)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (removeFromFavorites != null) {
      return removeFromFavorites(this);
    }
    return orElse();
  }
}

abstract class RemoveFromFavorites implements FavoriteEvent {
  const factory RemoveFromFavorites(final Movie movie) =
      _$RemoveFromFavoritesImpl;

  @override
  Movie get movie;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveFromFavoritesImplCopyWith<_$RemoveFromFavoritesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckIfAddedImplCopyWith<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  factory _$$CheckIfAddedImplCopyWith(
          _$CheckIfAddedImpl value, $Res Function(_$CheckIfAddedImpl) then) =
      __$$CheckIfAddedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Movie movie});

  @override
  $MovieCopyWith<$Res> get movie;
}

/// @nodoc
class __$$CheckIfAddedImplCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res, _$CheckIfAddedImpl>
    implements _$$CheckIfAddedImplCopyWith<$Res> {
  __$$CheckIfAddedImplCopyWithImpl(
      _$CheckIfAddedImpl _value, $Res Function(_$CheckIfAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movie = null,
  }) {
    return _then(_$CheckIfAddedImpl(
      null == movie
          ? _value.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }
}

/// @nodoc

class _$CheckIfAddedImpl implements CheckIfAdded {
  const _$CheckIfAddedImpl(this.movie);

  @override
  final Movie movie;

  @override
  String toString() {
    return 'FavoriteEvent.checkIfAdded(movie: $movie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckIfAddedImpl &&
            (identical(other.movie, movie) || other.movie == movie));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movie);

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckIfAddedImplCopyWith<_$CheckIfAddedImpl> get copyWith =>
      __$$CheckIfAddedImplCopyWithImpl<_$CheckIfAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Movie movie) addToFavorites,
    required TResult Function(Movie movie) removeFromFavorites,
    required TResult Function(Movie movie) checkIfAdded,
  }) {
    return checkIfAdded(movie);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Movie movie)? addToFavorites,
    TResult? Function(Movie movie)? removeFromFavorites,
    TResult? Function(Movie movie)? checkIfAdded,
  }) {
    return checkIfAdded?.call(movie);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Movie movie)? addToFavorites,
    TResult Function(Movie movie)? removeFromFavorites,
    TResult Function(Movie movie)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (checkIfAdded != null) {
      return checkIfAdded(movie);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToFavorites value) addToFavorites,
    required TResult Function(RemoveFromFavorites value) removeFromFavorites,
    required TResult Function(CheckIfAdded value) checkIfAdded,
  }) {
    return checkIfAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToFavorites value)? addToFavorites,
    TResult? Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult? Function(CheckIfAdded value)? checkIfAdded,
  }) {
    return checkIfAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToFavorites value)? addToFavorites,
    TResult Function(RemoveFromFavorites value)? removeFromFavorites,
    TResult Function(CheckIfAdded value)? checkIfAdded,
    required TResult orElse(),
  }) {
    if (checkIfAdded != null) {
      return checkIfAdded(this);
    }
    return orElse();
  }
}

abstract class CheckIfAdded implements FavoriteEvent {
  const factory CheckIfAdded(final Movie movie) = _$CheckIfAddedImpl;

  @override
  Movie get movie;

  /// Create a copy of FavoriteEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckIfAddedImplCopyWith<_$CheckIfAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
