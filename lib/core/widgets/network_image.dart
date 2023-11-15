import 'package:cached_network_image/cached_network_image.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:eden_work_sample/core/utils/context_utils.dart';
import 'package:eden_work_sample/core/widgets/shimmer.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String url;
  final double height;
  final double width;
  final BoxShape shape;
  final BoxFit fit;
  const NetworkImageWidget({
    super.key,
    required this.url,
    this.height = 80,
    this.width = 80,
    this.shape = BoxShape.rectangle,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        imageBuilder: (context, imageProvider) => Container(
          height: Config.y(height),
          width: Config.y(width),
          decoration: BoxDecoration(
            shape: shape,
            color: context.theme.dividerColor,
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
            ),
          ),
        ),
        placeholder: (context, url) => ShimmerWidget(
          height: Config.y(height),
          width: Config.y(width),
          shape: shape,
        ),
        errorWidget: (context, url, _) => Container(
          height: Config.y(height),
          width: Config.y(width),
          decoration: BoxDecoration(
            shape: shape,
            color: context.theme.dividerColor,
            image: DecorationImage(
              image: const AssetImage('assets/images/splash.png'),
              fit: fit,
            ),
          ),
        ),
      ),
    );
  }
}
