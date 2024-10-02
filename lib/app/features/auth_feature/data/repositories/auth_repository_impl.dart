import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/datasource/auth_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/sing_in_mode.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_in_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_up_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_in_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_up_result.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasourceNtw _datasourceNtw;

  AuthRepositoryImpl({required AuthDatasourceNtw datasourceNtw})
      : _datasourceNtw = datasourceNtw;
  @override
  Future<SignInResult> signIn({required SignInEntity signInModel}) async {
    try {
      final model = SignInModel.entityToModel(entity: signInModel);
      final response = await _datasourceNtw.sigIn(model: model);
      final accessToken = response['access_token'].toString();
      final status = response['status'].toString();
      return SignInSuccess(accessToken: accessToken, status: status);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400 || e.response?.statusCode == 404) {
          return SignInFailure(
            signInFailureStatus: SignInFailureStatus.unAuthorized,
          );
        } else if (e.response?.statusCode == 500) {
          return SignInFailure(signInFailureStatus: SignInFailureStatus.server);
        } else if (e.type == DioExceptionType.connectionError) {
          return SignInFailure(
              signInFailureStatus: SignInFailureStatus.network);
        } else {
          return SignInFailure(
              signInFailureStatus: SignInFailureStatus.unknown);
        }
      } else {
        return SignInFailure(signInFailureStatus: SignInFailureStatus.unknown);
      }
    }
  }

  @override
  Future<SignUpResult> signUp({required SignUpEntity signInModel}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
