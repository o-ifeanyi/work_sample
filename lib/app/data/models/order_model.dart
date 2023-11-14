import 'package:eden_work_sample/app/data/models/order_status_model.dart';
import 'package:eden_work_sample/core/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/order_model.freezed.dart';
part 'generated/order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    required String id,
    required String item,
    required int quantity,
    required double price,
    required List<OrderStatusModel> status,
    required DateTime orderDate,
  }) = _OrderModel;

  factory OrderModel.fromJson(JsonObject json) => _$OrderModelFromJson(json);
}
