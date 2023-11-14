// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../order_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderStatusModel _$OrderStatusModelFromJson(Map<String, dynamic> json) {
  return _OrderStatusModel.fromJson(json);
}

/// @nodoc
mixin _$OrderStatusModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusModelCopyWith<OrderStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusModelCopyWith<$Res> {
  factory $OrderStatusModelCopyWith(
          OrderStatusModel value, $Res Function(OrderStatusModel) then) =
      _$OrderStatusModelCopyWithImpl<$Res, OrderStatusModel>;
  @useResult
  $Res call({String id, String title, String description, DateTime date});
}

/// @nodoc
class _$OrderStatusModelCopyWithImpl<$Res, $Val extends OrderStatusModel>
    implements $OrderStatusModelCopyWith<$Res> {
  _$OrderStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderStatusModelImplCopyWith<$Res>
    implements $OrderStatusModelCopyWith<$Res> {
  factory _$$OrderStatusModelImplCopyWith(_$OrderStatusModelImpl value,
          $Res Function(_$OrderStatusModelImpl) then) =
      __$$OrderStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String description, DateTime date});
}

/// @nodoc
class __$$OrderStatusModelImplCopyWithImpl<$Res>
    extends _$OrderStatusModelCopyWithImpl<$Res, _$OrderStatusModelImpl>
    implements _$$OrderStatusModelImplCopyWith<$Res> {
  __$$OrderStatusModelImplCopyWithImpl(_$OrderStatusModelImpl _value,
      $Res Function(_$OrderStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
  }) {
    return _then(_$OrderStatusModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStatusModelImpl implements _OrderStatusModel {
  const _$OrderStatusModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.date});

  factory _$OrderStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStatusModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'OrderStatusModel(id: $id, title: $title, description: $description, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStatusModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStatusModelImplCopyWith<_$OrderStatusModelImpl> get copyWith =>
      __$$OrderStatusModelImplCopyWithImpl<_$OrderStatusModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStatusModelImplToJson(
      this,
    );
  }
}

abstract class _OrderStatusModel implements OrderStatusModel {
  const factory _OrderStatusModel(
      {required final String id,
      required final String title,
      required final String description,
      required final DateTime date}) = _$OrderStatusModelImpl;

  factory _OrderStatusModel.fromJson(Map<String, dynamic> json) =
      _$OrderStatusModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$OrderStatusModelImplCopyWith<_$OrderStatusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
