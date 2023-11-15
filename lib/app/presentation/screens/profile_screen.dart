import 'package:eden_work_sample/app/presentation/provider/auth_provider.dart';
import 'package:eden_work_sample/app/presentation/provider/theme_provider.dart';
import 'package:eden_work_sample/app/presentation/widgets/default_app_bar.dart';
import 'package:eden_work_sample/core/routes/routes.dart';
import 'package:eden_work_sample/core/utils/app_icons.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:eden_work_sample/core/theme/theme.dart';
import 'package:eden_work_sample/core/widgets/custom_button.dart';
import 'package:eden_work_sample/core/widgets/network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user!;
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: ListView(
        padding: Config.contentPadding(h: 20, v: 20),
        children: [
          NetworkImageWidget(
            url: user.photoUrl,
            height: 100,
            width: 100,
            shape: BoxShape.circle,
            fit: BoxFit.contain,
          ),
          Config.vGap10,
          Text(user.name, textAlign: TextAlign.center),
          Config.vGap5,
          Text(user.email, textAlign: TextAlign.center),
          Config.vGap60,
          CupertinoSlidingSegmentedControl<ThemeOptions>(
            groupValue: ref.watch(themeProvider),
            padding: Config.contentPadding(h: 8, v: 8),
            children: const {
              ThemeOptions.light: Padding(
                padding: EdgeInsets.all(8),
                child: Text('Light'),
              ),
              ThemeOptions.dark: Text('Dark'),
              ThemeOptions.system: Text('System'),
            },
            onValueChanged: (option) {
              if (option != null) {
                ref.read(themeProvider.notifier).setTheme(option);
              }
            },
          ),
          Config.vGap20,
          CustomButton(
            text: 'Logout',
            icon: Icon(AppIcons.logout),
            onPressed: () {
              ref.read(authProvider.notifier).logout().then((success) {
                if (success) context.go(Routes.auth);
              });
            },
          ),
          Config.vGap30,
        ],
      ),
    );
  }
}
