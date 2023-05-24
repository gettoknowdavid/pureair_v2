// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueFailure<T> {
  T? get f => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? f) empty,
    required TResult Function(T? f) invalidEmail,
    required TResult Function(T? f) invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? f)? empty,
    TResult? Function(T? f)? invalidEmail,
    TResult? Function(T? f)? invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? f)? empty,
    TResult Function(T? f)? invalidEmail,
    TResult Function(T? f)? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_InvalidEmail<T> value) invalidEmail,
    required TResult Function(_InvalidPassword<T> value) invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_InvalidEmail<T> value)? invalidEmail,
    TResult? Function(_InvalidPassword<T> value)? invalidPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailureCopyWith<T, ValueFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res, ValueFailure<T>>;
  @useResult
  $Res call({T? f});
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res, $Val extends ValueFailure<T>>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = freezed,
  }) {
    return _then(_value.copyWith(
      f: freezed == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmptyCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$_EmptyCopyWith(
          _$_Empty<T> value, $Res Function(_$_Empty<T>) then) =
      __$$_EmptyCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? f});
}

/// @nodoc
class __$$_EmptyCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$_Empty<T>>
    implements _$$_EmptyCopyWith<T, $Res> {
  __$$_EmptyCopyWithImpl(_$_Empty<T> _value, $Res Function(_$_Empty<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = freezed,
  }) {
    return _then(_$_Empty<T>(
      freezed == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Empty<T> implements _Empty<T> {
  const _$_Empty([this.f]);

  @override
  final T? f;

  @override
  String toString() {
    return 'ValueFailure<$T>.empty(f: $f)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Empty<T> &&
            const DeepCollectionEquality().equals(other.f, f));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(f));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmptyCopyWith<T, _$_Empty<T>> get copyWith =>
      __$$_EmptyCopyWithImpl<T, _$_Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? f) empty,
    required TResult Function(T? f) invalidEmail,
    required TResult Function(T? f) invalidPassword,
  }) {
    return empty(f);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? f)? empty,
    TResult? Function(T? f)? invalidEmail,
    TResult? Function(T? f)? invalidPassword,
  }) {
    return empty?.call(f);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? f)? empty,
    TResult Function(T? f)? invalidEmail,
    TResult Function(T? f)? invalidPassword,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(f);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_InvalidEmail<T> value) invalidEmail,
    required TResult Function(_InvalidPassword<T> value) invalidPassword,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_InvalidEmail<T> value)? invalidEmail,
    TResult? Function(_InvalidPassword<T> value)? invalidPassword,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> implements ValueFailure<T> {
  const factory _Empty([final T? f]) = _$_Empty<T>;

  @override
  T? get f;
  @override
  @JsonKey(ignore: true)
  _$$_EmptyCopyWith<T, _$_Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InvalidEmailCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$_InvalidEmailCopyWith(
          _$_InvalidEmail<T> value, $Res Function(_$_InvalidEmail<T>) then) =
      __$$_InvalidEmailCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? f});
}

/// @nodoc
class __$$_InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$_InvalidEmail<T>>
    implements _$$_InvalidEmailCopyWith<T, $Res> {
  __$$_InvalidEmailCopyWithImpl(
      _$_InvalidEmail<T> _value, $Res Function(_$_InvalidEmail<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = freezed,
  }) {
    return _then(_$_InvalidEmail<T>(
      freezed == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_InvalidEmail<T> implements _InvalidEmail<T> {
  const _$_InvalidEmail([this.f]);

  @override
  final T? f;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(f: $f)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidEmail<T> &&
            const DeepCollectionEquality().equals(other.f, f));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(f));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidEmailCopyWith<T, _$_InvalidEmail<T>> get copyWith =>
      __$$_InvalidEmailCopyWithImpl<T, _$_InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? f) empty,
    required TResult Function(T? f) invalidEmail,
    required TResult Function(T? f) invalidPassword,
  }) {
    return invalidEmail(f);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? f)? empty,
    TResult? Function(T? f)? invalidEmail,
    TResult? Function(T? f)? invalidPassword,
  }) {
    return invalidEmail?.call(f);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? f)? empty,
    TResult Function(T? f)? invalidEmail,
    TResult Function(T? f)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(f);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_InvalidEmail<T> value) invalidEmail,
    required TResult Function(_InvalidPassword<T> value) invalidPassword,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_InvalidEmail<T> value)? invalidEmail,
    TResult? Function(_InvalidPassword<T> value)? invalidPassword,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class _InvalidEmail<T> implements ValueFailure<T> {
  const factory _InvalidEmail([final T? f]) = _$_InvalidEmail<T>;

  @override
  T? get f;
  @override
  @JsonKey(ignore: true)
  _$$_InvalidEmailCopyWith<T, _$_InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InvalidPasswordCopyWith<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  factory _$$_InvalidPasswordCopyWith(_$_InvalidPassword<T> value,
          $Res Function(_$_InvalidPassword<T>) then) =
      __$$_InvalidPasswordCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? f});
}

/// @nodoc
class __$$_InvalidPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$_InvalidPassword<T>>
    implements _$$_InvalidPasswordCopyWith<T, $Res> {
  __$$_InvalidPasswordCopyWithImpl(
      _$_InvalidPassword<T> _value, $Res Function(_$_InvalidPassword<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? f = freezed,
  }) {
    return _then(_$_InvalidPassword<T>(
      freezed == f
          ? _value.f
          : f // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_InvalidPassword<T> implements _InvalidPassword<T> {
  const _$_InvalidPassword([this.f]);

  @override
  final T? f;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidPassword(f: $f)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvalidPassword<T> &&
            const DeepCollectionEquality().equals(other.f, f));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(f));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidPasswordCopyWith<T, _$_InvalidPassword<T>> get copyWith =>
      __$$_InvalidPasswordCopyWithImpl<T, _$_InvalidPassword<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? f) empty,
    required TResult Function(T? f) invalidEmail,
    required TResult Function(T? f) invalidPassword,
  }) {
    return invalidPassword(f);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? f)? empty,
    TResult? Function(T? f)? invalidEmail,
    TResult? Function(T? f)? invalidPassword,
  }) {
    return invalidPassword?.call(f);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? f)? empty,
    TResult Function(T? f)? invalidEmail,
    TResult Function(T? f)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(f);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(_InvalidEmail<T> value) invalidEmail,
    required TResult Function(_InvalidPassword<T> value) invalidPassword,
  }) {
    return invalidPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(_InvalidEmail<T> value)? invalidEmail,
    TResult? Function(_InvalidPassword<T> value)? invalidPassword,
  }) {
    return invalidPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Empty<T> value)? empty,
    TResult Function(_InvalidEmail<T> value)? invalidEmail,
    TResult Function(_InvalidPassword<T> value)? invalidPassword,
    required TResult orElse(),
  }) {
    if (invalidPassword != null) {
      return invalidPassword(this);
    }
    return orElse();
  }
}

abstract class _InvalidPassword<T> implements ValueFailure<T> {
  const factory _InvalidPassword([final T? f]) = _$_InvalidPassword<T>;

  @override
  T? get f;
  @override
  @JsonKey(ignore: true)
  _$$_InvalidPasswordCopyWith<T, _$_InvalidPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
