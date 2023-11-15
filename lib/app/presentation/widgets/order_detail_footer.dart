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
                  price: order.price * order.quantity,
                ),
                Config.vGap10,
                const OrderSummaryInfo(
                  leading: 'Delivery',
                  price: 800.0,
                ),
                Config.vGap10,
                OrderSummaryInfo(
                  leading: 'Total',
                  price: (order.price * order.quantity) + 800.0,
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
    required this.price,
  });

  final String leading;
  final double price;

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
        Text(price.formatedPrice),
      ],
    );
  }
}
