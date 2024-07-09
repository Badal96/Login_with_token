// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_code_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyCodeState {
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyCodeStateCopyWith<VerifyCodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyCodeStateCopyWith<$Res> {
  factory $VerifyCodeStateCopyWith(
          VerifyCodeState value, $Res Function(VerifyCodeState) then) =
      _$VerifyCodeStateCopyWithImpl<$Res, VerifyCodeState>;
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class _$VerifyCodeStateCopyWithImpl<$Res, $Val extends VerifyCodeState>
    implements $VerifyCodeStateCopyWith<$Res> {
  _$VerifyCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_value.copyWith(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyCodeStateImplCopyWith<$Res>
    implements $VerifyCodeStateCopyWith<$Res> {
  factory _$$VerifyCodeStateImplCopyWith(_$VerifyCodeStateImpl value,
          $Res Function(_$VerifyCodeStateImpl) then) =
      __$$VerifyCodeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int currentIndex});
}

/// @nodoc
class __$$VerifyCodeStateImplCopyWithImpl<$Res>
    extends _$VerifyCodeStateCopyWithImpl<$Res, _$VerifyCodeStateImpl>
    implements _$$VerifyCodeStateImplCopyWith<$Res> {
  __$$VerifyCodeStateImplCopyWithImpl(
      _$VerifyCodeStateImpl _value, $Res Function(_$VerifyCodeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentIndex = null,
  }) {
    return _then(_$VerifyCodeStateImpl(
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$VerifyCodeStateImpl implements _VerifyCodeState {
  const _$VerifyCodeStateImpl({this.currentIndex = 0});

  @override
  @JsonKey()
  final int currentIndex;

  @override
  String toString() {
    return 'VerifyCodeState(currentIndex: $currentIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCodeStateImpl &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCodeStateImplCopyWith<_$VerifyCodeStateImpl> get copyWith =>
      __$$VerifyCodeStateImplCopyWithImpl<_$VerifyCodeStateImpl>(
          this, _$identity);
}

abstract class _VerifyCodeState implements VerifyCodeState {
  const factory _VerifyCodeState({final int currentIndex}) =
      _$VerifyCodeStateImpl;

  @override
  int get currentIndex;
  @override
  @JsonKey(ignore: true)
  _$$VerifyCodeStateImplCopyWith<_$VerifyCodeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
