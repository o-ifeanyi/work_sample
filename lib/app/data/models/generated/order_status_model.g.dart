// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderStatusModelImpl _$$OrderStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderStatusModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$OrderStatusModelImplToJson(
        _$OrderStatusModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date.toIso8601String(),
    };
