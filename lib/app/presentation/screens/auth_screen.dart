import 'package:eden_work_sample/app/data/models/user_model.dart';
import 'package:eden_work_sample/app/presentation/provider/auth_provider.dart';
import 'package:eden_work_sample/app/presentation/provider/auth_state.dart';
import 'package:eden_work_sample/core/di/service_locator.dart';
import 'package:eden_work_sample/core/platform_specific/platform_progress_indicator.dart';
import 'package:eden_work_sample/core/routes/routes.dart';
import 'package:eden_work_sample/core/utils/app_icons.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:eden_work_sample/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final currentUser = sl<FirebaseAuth>().currentUser;
      if (currentUser != null) {
        final user = UserModel.fromUser(currentUser);
        ref.read(authProvider.notifier).updateUser(user);
        context.go(Routes.orders);
      }
      FlutterNativeSplash.remove();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Config.contentPadding(h: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/check.png',
              height: Config.y(120),
            ),
            Config.vGap15,
            Text(
              'Eden Work Sample',
              textAlign: TextAlign.center,
              style: Config.textTheme.titleMedium,
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            switch (ref.watch(authProvider).state) {
              AuthLoadingState.signingInGoogle =>
                const PlatformProgressIndicator(),
              _ => CustomButton(
                  hPadding: 20,
                  text: 'Continue with Google',
                  icon: Icon(AppIcons.google, size: 18),
                  onPressed: () async {
                    await ref
                        .read(authProvider.notifier)
                        .continueWithGoogle()
                        .then((success) {
                      if (success) context.go(Routes.orders);
                    });
                  },
                )
            },
            Config.vGap15,
          ],
        ),
      ),
    );
  }
}
