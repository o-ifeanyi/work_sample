import 'package:eden_work_sample/core/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/order_status_model.freezed.dart';
part 'generated/order_status_model.g.dart';

@freezed
class OrderStatusModel with _$OrderStatusModel {
  const factory OrderStatusModel({
    required String id,
    required String nextId,
    required String title,
    required String description,
    required DateTime date,
  }) = _OrderStatusModel;

  factory OrderStatusModel.placed(DateTime date) => OrderStatusModel(
        id: '1',
        nextId: '2',
        title: 'Order placed',
        description: 'Waiting for the vendor to accept your order.',
        date: date,
      );

  factory OrderStatusModel.accepted(DateTime date) => OrderStatusModel(
        id: '2',
        nextId: '3',
        title: 'Order accepted',
        description:
            'The vendor is preparing your order and a rider will pick up soon.',
        date: date,
      );

  factory OrderStatusModel.pickUpInProgress(DateTime date) => OrderStatusModel(
        id: '3',
        nextId: '4',
        title: 'Order pickup in progress',
        description:
            'A rider is on the way to the vendor to pick up your order.',
        date: date,
      );

  factory OrderStatusModel.dropOffInProgress(DateTime date) => OrderStatusModel(
        id: '4',
        nextId: '5',
        title: 'Order on the way',
        description:
            'A rider has picked up your order and is bringing it your way.',
        date: date,
      );

  factory OrderStatusModel.arrived(DateTime date) => OrderStatusModel(
        id: '5',
        nextId: '6',
        title: 'Order arrived',
        description: 'Don\'t keep the rider waiting.',
        date: date,
      );

  factory OrderStatusModel.delivered(DateTime date) => OrderStatusModel(
        id: '6',
        nextId: '',
        title: 'Order delivered',
        description: 'Enjoy!',
        date: date,
      );

  factory OrderStatusModel.fromJson(JsonObject json) =>
      _$OrderStatusModelFromJson(json);
}
