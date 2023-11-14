import 'package:eden_work_sample/app/data/models/result.dart';
import 'package:eden_work_sample/app/data/models/user_model.dart';
import 'package:eden_work_sample/app/domain/auth_repository.dart';
import 'package:eden_work_sample/core/utils/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  const AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<Result<UserModel>> continueWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: ['email'],
        clientId: Config.isAndroid
            ? '912749325449-9kpu55bnotatqjle6186fffau34qo5pv.apps.googleusercontent.com'
            : null,
      ).signIn();
      if (googleUser == null) {
        return Result.error(CustomError.message('Authenticataion failed'));
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential =
          await firebaseAuth.signInWithCredential(credential);

      return Result.success(UserModel.fromUser(userCredential.user!));
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Authenticataion failed'));
    }
  }

  @override
  Future<Result<bool>> logoutUser() async {
    try {
      await firebaseAuth.signOut();
      return const Result.success(true);
    } catch (error) {
      debugPrint('$error');
      return Result.error(CustomError.message('Log out failed'));
    }
  }
}
