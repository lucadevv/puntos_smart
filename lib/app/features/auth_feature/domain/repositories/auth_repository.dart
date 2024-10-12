import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/send_codeotp_entity.dart';

import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/send_number_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_in_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_up_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/verify_codeotp_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/verify_number_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_in_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_up_result.dart';

abstract class AuthRepository {
  Future<SignInResult> signIn({required SignInEntity signInEntity});
  Future<SignUpResult> signUp({required SignUpEntity signUpEntity});
  Future<VerifyNumberResult> verifyNumber(
      {required SendNumberEntity sendNumberEntity});
  Future<VerifyCodeOtpResult> verifyCode(
      {required SendCodeOtpEntity sendCodeOtpEntity});
}
