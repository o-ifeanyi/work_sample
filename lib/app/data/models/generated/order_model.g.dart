// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      item: json['item'] as String,
      quantity: json['quantity'] as int,
      price: (json['price'] as num).toDouble(),
      status: (json['status'] as List<dynamic>)
          .map((e) => OrderStatusModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderDate: DateTime.parse(json['orderDate'] as String),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'quantity': instance.quantity,
      'price': instance.price,
      'status': instance.status.map((e) => e.toJson()).toList(),
      'orderDate': instance.orderDate.toIso8601String(),
    };
