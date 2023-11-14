import 'package:eden_work_sample/app/data/models/order_model.dart';
import 'package:eden_work_sample/core/extensions/extentions.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:flutter/material.dart';

class OrderDetailFooter extends StatelessWidget {
  const OrderDetailFooter({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: Config.contentPadding(h: 20, v: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OrderSummaryInfo(
                  leading: 'Sub total',
                  trailing: (order.price * order.quantity).formatedPrice,
                ),
                Config.vGap10,
                OrderSummaryInfo(
                  leading: 'Delivery',
                  trailing: 800.0.formatedPrice,
                ),
                Config.vGap10,
                OrderSummaryInfo(
                  leading: 'Total',
                  trailing:
                      ((order.price * order.quantity) + 800.0).formatedPrice,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OrderSummaryInfo extends StatelessWidget {
  const OrderSummaryInfo({
    super.key,
    required this.leading,
    required this.trailing,
  });

  final String leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leading,
          style: Config.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(trailing),
      ],
    );
  }
}
