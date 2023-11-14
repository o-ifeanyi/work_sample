import 'package:eden_work_sample/app/presentation/provider/order_provider.dart';
import 'package:eden_work_sample/app/presentation/widgets/default_app_bar.dart';
import 'package:eden_work_sample/app/presentation/widgets/order_item.dart';
import 'package:eden_work_sample/core/platform_specific/platform_progress_indicator.dart';
import 'package:eden_work_sample/core/routes/routes.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(orderProvider.notifier).getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderProvider);
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: state.whenOrNull(
        loading: () => const Center(
          child: PlatformProgressIndicator(),
        ),
        loaded: (orders) {
          return RefreshIndicator(
            onRefresh: () => ref.read(orderProvider.notifier).getOrders(),
            child: ListView.separated(
              padding: Config.contentPadding(h: 20, v: 20),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return GestureDetector(
                  onTap: () => context.goNamed(Routes.orderDetail,
                      pathParameters: {'id': order.id}),
                  child: Hero(
                    tag: 'order_item${order.id}',
                    child: OrderItem(order: order),
                  ),
                );
              },
              separatorBuilder: (_, __) => Config.vGap15,
            ),
          );
        },
        error: (message) => Center(
          child: Text(message),
        ),
      ),
    );
  }
}
