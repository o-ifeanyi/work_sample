import 'package:flutter/material.dart';

enum ButtonType { filled, outlined, elevated, text }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
    this.hPadding = 0,
    this.cPadding = 18,
    this.type = ButtonType.filled,
  });

  final void Function()? onPressed;
  final String text;
  final double hPadding;
  final double cPadding;
  final Widget? icon;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    final child = Padding(
      padding: EdgeInsets.all(cPadding),
      child: Text(text),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding),
      child: switch (type) {
        ButtonType.filled => FilledButton.icon(
            onPressed: onPressed,
            label: child,
            icon: icon ?? const SizedBox.shrink(),
            style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
          ),
        ButtonType.outlined => OutlinedButton.icon(
            onPressed: onPressed,
            label: child,
            icon: icon ?? const SizedBox.shrink(),
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
          ),
        ButtonType.elevated => ElevatedButton.icon(
            onPressed: onPressed,
            label: child,
            icon: icon ?? const SizedBox.shrink(),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
          ),
        ButtonType.text => TextButton.icon(
            onPressed: onPressed,
            label: child,
            icon: icon ?? const SizedBox.shrink(),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
          ),
      },
    );
  }
}
