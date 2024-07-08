// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceRecord _$PriceRecordFromJson(Map<String, dynamic> json) {
  return _PriceRecord.fromJson(json);
}

/// @nodoc
mixin _$PriceRecord {
  String get opinion => throw _privateConstructorUsedError;
  int get probability => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceRecordCopyWith<PriceRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceRecordCopyWith<$Res> {
  factory $PriceRecordCopyWith(
          PriceRecord value, $Res Function(PriceRecord) then) =
      _$PriceRecordCopyWithImpl<$Res, PriceRecord>;
  @useResult
  $Res call({String opinion, int probability, DateTime timestamp});
}

/// @nodoc
class _$PriceRecordCopyWithImpl<$Res, $Val extends PriceRecord>
    implements $PriceRecordCopyWith<$Res> {
  _$PriceRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opinion = null,
    Object? probability = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      opinion: null == opinion
          ? _value.opinion
          : opinion // ignore: cast_nullable_to_non_nullable
              as String,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceRecordImplCopyWith<$Res>
    implements $PriceRecordCopyWith<$Res> {
  factory _$$PriceRecordImplCopyWith(
          _$PriceRecordImpl value, $Res Function(_$PriceRecordImpl) then) =
      __$$PriceRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String opinion, int probability, DateTime timestamp});
}

/// @nodoc
class __$$PriceRecordImplCopyWithImpl<$Res>
    extends _$PriceRecordCopyWithImpl<$Res, _$PriceRecordImpl>
    implements _$$PriceRecordImplCopyWith<$Res> {
  __$$PriceRecordImplCopyWithImpl(
      _$PriceRecordImpl _value, $Res Function(_$PriceRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opinion = null,
    Object? probability = null,
    Object? timestamp = null,
  }) {
    return _then(_$PriceRecordImpl(
      opinion: null == opinion
          ? _value.opinion
          : opinion // ignore: cast_nullable_to_non_nullable
              as String,
      probability: null == probability
          ? _value.probability
          : probability // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceRecordImpl extends _PriceRecord {
  _$PriceRecordImpl(
      {required this.opinion,
      required this.probability,
      required this.timestamp})
      : super._();

  factory _$PriceRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceRecordImplFromJson(json);

  @override
  final String opinion;
  @override
  final int probability;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'PriceRecord(opinion: $opinion, probability: $probability, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceRecordImpl &&
            (identical(other.opinion, opinion) || other.opinion == opinion) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, opinion, probability, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceRecordImplCopyWith<_$PriceRecordImpl> get copyWith =>
      __$$PriceRecordImplCopyWithImpl<_$PriceRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceRecordImplToJson(
      this,
    );
  }
}

abstract class _PriceRecord extends PriceRecord {
  factory _PriceRecord(
      {required final String opinion,
      required final int probability,
      required final DateTime timestamp}) = _$PriceRecordImpl;
  _PriceRecord._() : super._();

  factory _PriceRecord.fromJson(Map<String, dynamic> json) =
      _$PriceRecordImpl.fromJson;

  @override
  String get opinion;
  @override
  int get probability;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$PriceRecordImplCopyWith<_$PriceRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
