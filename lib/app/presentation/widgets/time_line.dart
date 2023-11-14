import 'package:eden_work_sample/app/data/models/order_model.dart';
import 'package:eden_work_sample/core/extensions/extentions.dart';
import 'package:eden_work_sample/core/utils/app_icons.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: order.status
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    child: Icon(AppIcons.done, size: 20),
                  ),
                  Config.hGap15,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: Config.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Config.vGap5,
                        Text(
                          e.description,
                          style: Config.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    e.date.formatTime,
                    style: Config.textTheme.bodySmall,
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
