import 'package:eden_work_sample/core/utils/context_utils.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.value, required this.length});

  final int value;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(length, (index) {
        return Expanded(
          child: Container(
            height: 5,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: index >= value
                  ? context.theme.dividerColor
                  : context.colorScheme.primary,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        );
      }),
    );
  }
}
