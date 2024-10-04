import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/send_code_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/send_number_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_in_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_up_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/send_code_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/send_number_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_in_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_up_result.dart';

abstract class AuthRepository {
  Future<SignInResult> signIn({required SignInEntity signInEntity});
  Future<SignUpResult> signUp({required SignUpEntity signUpEntity});
  Future<SendNumberResult> sendNumber(
      {required SendNumberEntity sendNumberEntity});
  Future<SendCodeResult> sendCode(
      {required SendCodeRequestEntity sendCodeRequestEntity});
}
