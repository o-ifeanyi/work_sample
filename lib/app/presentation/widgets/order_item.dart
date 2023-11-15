import 'package:eden_work_sample/app/data/models/order_model.dart';
import 'package:eden_work_sample/core/extensions/extentions.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:eden_work_sample/core/utils/context_utils.dart';
import 'package:eden_work_sample/core/widgets/network_image.dart';
import 'package:eden_work_sample/core/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: Config.contentPadding(h: 10, v: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NetworkImageWidget(url: order.photoUrl),
                Config.hGap15,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: order.item,
                          style: Config.textTheme.bodyLarge?.copyWith(
                              color: context.theme.textTheme.bodyLarge?.color),
                          children: [
                            TextSpan(
                              text: ' x${order.quantity}',
                              style: Config.textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Text(
                        order.price.formatedPrice,
                        style: Config.textTheme.titleSmall,
                      ),
                      Text(
                        order.orderDate.formatDateTime,
                        style: Config.textTheme.labelMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Config.vGap10,
            Text(
              order.status.last.title,
              style: Config.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(order.status.last.description),
            Config.vGap20,
            ProgressBar(value: order.status.length, length: 6),
          ],
        ),
      ),
    );
  }
}
