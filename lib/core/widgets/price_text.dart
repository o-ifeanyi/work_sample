import 'package:eden_work_sample/core/extensions/extentions.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:eden_work_sample/core/utils/context_utils.dart';
import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  const PriceText({
    super.key,
    required this.price,
    this.priceStyle,
  });

  final double price;
  final TextStyle? priceStyle;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'NGN'.currency,
        style: Config.textTheme.bodyMedium?.copyWith(
          fontFamily: '',
          color: context.theme.textTheme.bodyMedium?.color,
        ),
        children: [
          TextSpan(
            text: price.formatedPrice,
            style: priceStyle,
          )
        ],
      ),
    );
  }
}
