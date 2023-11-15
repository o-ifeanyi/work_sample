import 'package:eden_work_sample/core/utils/config.dart';
import 'package:eden_work_sample/core/utils/context_utils.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double? width;
  final BoxShape shape;
  const ShimmerWidget({
    super.key,
    required this.height,
    this.width,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Shimmer.fromColors(
        highlightColor: context.colorScheme.primaryContainer,
        baseColor: context.colorScheme.primary,
        child: Container(
          height: Config.y(height),
          width: width == null ? null : Config.y(width!),
          decoration: BoxDecoration(
            shape: shape,
            color: context.theme.dividerColor,
          ),
        ),
      ),
    );
  }
}
