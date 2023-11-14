import 'dart:async';
import 'package:eden_work_sample/app/presentation/provider/theme_provider.dart';
import 'package:eden_work_sample/core/di/service_locator.dart';
import 'package:eden_work_sample/core/routes/router.dart';
import 'package:eden_work_sample/core/utils/app_aware.dart';
import 'package:eden_work_sample/core/theme/theme.dart';
import 'package:eden_work_sample/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runZonedGuarded(
    () async {
      final binding = WidgetsFlutterBinding.ensureInitialized();
      Paint.enableDithering = true;
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      FlutterNativeSplash.preserve(widgetsBinding: binding);
      await initServiceLocator();
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      if (kReleaseMode) {
        debugPrint = (String? message, {int? wrapWidth}) {};
      }

      runApp(const ProviderScope(child: MainApp()));
    },
    (error, stack) {
      debugPrint('$error: $stack');
    },
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) {
        return AppAware(
          child: MaterialApp.router(
            title: 'Eden Work Sample',
            theme: AppTheme.themeOptions(theme),
            darkTheme: AppTheme.darkTheme(),
            themeMode: AppTheme.themeMode(context),
            routerConfig: ref.watch(routerProvider),
            builder: (BuildContext context, Widget? child) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaleFactor.clamp(0.5, 1.0);
              return MediaQuery(
                data: mediaQueryData.copyWith(
                  textScaleFactor: scale,
                ),
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}
