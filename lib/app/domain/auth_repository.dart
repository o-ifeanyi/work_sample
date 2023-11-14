import 'package:eden_work_sample/app/data/models/result.dart';
import 'package:eden_work_sample/app/data/models/user_model.dart';

enum AuthType { google, github }

abstract class AuthRepository {
  Future<Result<UserModel>> continueWithGoogle();
  Future<Result<bool>> logoutUser();
}
