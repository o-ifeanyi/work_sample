import 'package:eden_work_sample/app/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/auth_state.freezed.dart';

enum AuthLoadingState {
  idle,
  signingInGoogle,
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthLoadingState.idle) AuthLoadingState state,
    @Default(null) UserModel? user,
  }) = _AuthState;
}
