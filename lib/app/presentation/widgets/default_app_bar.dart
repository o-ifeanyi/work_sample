import 'package:eden_work_sample/core/utils/config.dart';
import 'package:eden_work_sample/core/utils/context_utils.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const DefaultAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title ?? 'Eden WS',
        style: Config.textTheme.titleMedium
            ?.copyWith(color: context.colorScheme.primary),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
