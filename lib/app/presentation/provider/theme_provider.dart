import 'package:eden_work_sample/core/di/service_locator.dart';
import 'package:eden_work_sample/core/theme/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider = NotifierProvider<ThemeProvider, ThemeOptions>(
  () => sl<ThemeProvider>(),
);

final class ThemeProvider extends Notifier<ThemeOptions> {
  final SharedPreferences sharedPreferences;
  ThemeProvider({required this.sharedPreferences});

  @override
  ThemeOptions build() {
    final currentTheme = sharedPreferences.getString('currentTheme') ?? '';
    return ThemeOptions.values.firstWhere(
      (theme) => theme.name == currentTheme,
      orElse: () => ThemeOptions.system,
    );
  }

  void setTheme(ThemeOptions themeOption) {
    state = themeOption;
    sharedPreferences.setString('currentTheme', themeOption.name);
  }
}
