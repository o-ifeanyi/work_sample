import 'package:eden_work_sample/app/data/models/order_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/order_state.freezed.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.idle() = _Idle;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.empty() = _Empty;
  const factory OrderState.loaded(List<OrderModel> orders) = _Loaded;
  const factory OrderState.error(String message) = _Error;
}
