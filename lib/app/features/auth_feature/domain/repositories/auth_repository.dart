import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_in_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_up_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_in_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_up_result.dart';

abstract class AuthRepository {
  Future<SignInResult> signIn({required SignInEntity signInModel});
  Future<SignUpResult> signUp({required SignUpEntity signInModel});
}
