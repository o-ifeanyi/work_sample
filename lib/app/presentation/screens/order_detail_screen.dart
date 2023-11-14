import 'package:eden_work_sample/app/presentation/provider/order_provider.dart';
import 'package:eden_work_sample/app/presentation/widgets/default_app_bar.dart';
import 'package:eden_work_sample/app/presentation/widgets/order_detail_footer.dart';
import 'package:eden_work_sample/app/presentation/widgets/order_item.dart';
import 'package:eden_work_sample/app/presentation/widgets/time_line.dart';
import 'package:eden_work_sample/core/platform_specific/platform_progress_indicator.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetailScreen extends ConsumerStatefulWidget {
  final String id;
  const OrderDetailScreen({super.key, required this.id});

  @override
  ConsumerState<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends ConsumerState<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderProvider);
    return state.maybeWhen(
      loading: () => const Center(
        child: PlatformProgressIndicator(),
      ),
      loaded: (orders) {
        final order = orders.where((e) => e.id == widget.id).firstOrNull;
        return Scaffold(
          appBar: DefaultAppBar(title: 'Order #${widget.id}'),
          body: order == null
              ? const Center(
                  child: Text('Order not found'),
                )
              : ListView(
                  padding: Config.contentPadding(h: 20, v: 20),
                  children: [
                    Hero(
                      tag: 'order_item${order.id}',
                      child: OrderItem(order: order),
                    ),
                    Config.vGap20,
                    Text(
                      'Order timeline',
                      style: Config.textTheme.titleSmall,
                    ),
                    Config.vGap20,
                    TimeLine(order: order)
                  ],
                ),
          bottomNavigationBar:
              order == null ? null : OrderDetailFooter(order: order),
        );
      },
      orElse: () {
        return const SizedBox.shrink();
      },
    );
  }
}
