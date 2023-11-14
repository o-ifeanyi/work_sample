import 'package:eden_work_sample/core/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/user_model.freezed.dart';
part 'generated/user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    required String name,
    required String photoUrl,
  }) = _UserModel;

  factory UserModel.fromJson(JsonObject json) => _$UserModelFromJson(json);

  factory UserModel.fromUser(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      photoUrl: user.photoURL ?? '',
    );
  }
}
