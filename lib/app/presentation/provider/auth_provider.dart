import 'package:eden_work_sample/app/data/models/user_model.dart';
import 'package:eden_work_sample/app/domain/auth_repository.dart';
import 'package:eden_work_sample/app/presentation/provider/auth_state.dart';
import 'package:eden_work_sample/core/di/service_locator.dart';
import 'package:eden_work_sample/core/services/dialog_service/dialog_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = NotifierProvider<AuthProvider, AuthState>(
  () => sl<AuthProvider>(),
);

final class AuthProvider extends Notifier<AuthState> {
  final AuthRepository authRepository;
  final DialogService dialogService;

  AuthProvider({
    required this.authRepository,
    required this.dialogService,
  });

  late OAuthCredential authCredential;

  @override
  AuthState build() => const AuthState();

  void updateUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  Future<bool> continueWithGoogle() async {
    state = state.copyWith(state: AuthLoadingState.signingInGoogle);
    final res = await authRepository.continueWithGoogle();
    state = state.copyWith(state: AuthLoadingState.idle);
    return res.when(
      success: (user) async {
        state = state.copyWith(user: user);
        return true;
      },
      error: (failure) {
        dialogService.displayMessage(failure.message);
        return false;
      },
    );
  }

  Future<bool> logout() async {
    final res = await authRepository.logoutUser();
    return res.when(
      success: (success) => success,
      error: (failure) {
        dialogService.displayMessage(failure.message);
        return false;
      },
    );
  }
}
