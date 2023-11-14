import 'package:eden_work_sample/core/utils/config.dart';
import 'package:eden_work_sample/core/utils/context_utils.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  const ProfileAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Config.y(100),
      decoration: BoxDecoration(
          color: context.colorScheme.secondaryContainer,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.contain,
          )),
    );
  }
}
