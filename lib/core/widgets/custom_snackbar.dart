import 'package:eden_work_sample/core/utils/config.dart';
import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String? title;
  final String message;
  final Color background;
  final void Function() onDismiss;

  const CustomSnackBar({
    super.key,
    required this.message,
    this.title,
    required this.background,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTapDown: (_) => onDismiss(),
        child: Container(
          padding: Config.contentPadding(h: 20, v: 25),
          width: size.width,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(5)),
            color: background,
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null) ...[
                  Text(
                    title!,
                    style: Config.textTheme.bodyMedium?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                ],
                Text(
                  message,
                  style: Config.textTheme.bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
