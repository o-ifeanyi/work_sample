import 'package:eden_work_sample/app/data/models/order_status_model.dart';
import 'package:eden_work_sample/app/presentation/provider/order_state.dart';
import 'package:eden_work_sample/core/constants/constants.dart';
import 'package:eden_work_sample/core/di/service_locator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderProvider = NotifierProvider<OrderProvider, OrderState>(
  () => sl<OrderProvider>(),
);

class OrderProvider extends Notifier<OrderState> {
  OrderProvider();

  final _orders = kOrders;
  @override
  OrderState build() => const OrderState.idle();

  Future<void> getOrders() async {
    state = const OrderState.loading();
    await Future.delayed(const Duration(seconds: 2));
    state = OrderState.loaded(_orders);
  }

  Future<void> updateOrder(String id, OrderStatusModel? status) async {
    if (status == null) return;
    final order = _orders.where((e) => e.id == id).firstOrNull;
    if (order == null ||
        order.status.any((e) => e.id == status.id) ||
        order.status.lastOrNull?.nextId != status.id) return;
    final orderIndex = _orders.indexOf(order);
    _orders[orderIndex] = order.copyWith(
      status: [...order.status, status],
    );
    state = OrderState.loaded(_orders);
  }
}
