import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/api/failure/error_handler.dart';
import 'package:puntos_smart_user/app/api/failure/error_send_code_hundler.dart';
import 'package:puntos_smart_user/app/api/failure/error_send_number_hundler.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/datasource/auth_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/send_code_request_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/send_number_request_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/sig_up_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/sing_in_mode.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/send_code_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/send_number_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_in_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/sign_up_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/send_code_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/send_number_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_in_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/sign_up_result.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasourceNtw _datasourceNtw;

  AuthRepositoryImpl({required AuthDatasourceNtw datasourceNtw})
      : _datasourceNtw = datasourceNtw;
  @override
  Future<SignInResult> signIn({required SignInEntity signInEntity}) async {
    try {
      final model = SignInModel.entityToModel(entity: signInEntity);
      final response = await _datasourceNtw.sigIn(model: model);
      final accessToken = response['access_token'].toString();
      final status = response['status'].toString();
      return SignInSuccess(accessToken: accessToken, status: status);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          return SignInFailure(
            signInFailureStatus: SignInFailureStatus.unAuthorized,
          );
        } else if (e.response?.statusCode == 404) {
          return SignInFailure(
            signInFailureStatus: SignInFailureStatus.notFound,
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
  Future<SignUpResult> signUp({required SignUpEntity signUpEntity}) async {
    try {
      final model = SignUpModel.entityToModel(signUpEntity);
      final response = await _datasourceNtw.sigUp(model: model);
      final accessToken = response['access_token'].toString();
      final status = response['status'].toString();
      final message = response['message'].toString();
      return SignUpSuccess(
          accessToken: accessToken, message: message, status: status);
    } catch (e) {
      if (e is DioException) {
        return SignUpFailure(
          signUpFailureStatus: ErrorHandler.handleDioError(e),
        );
      } else {
        return SignUpFailure(signUpFailureStatus: SignUpFailureStatus.unknown);
      }
    }
  }

  @override
  Future<SendNumberResult> sendNumber(
      {required SendNumberEntity sendNumberEntity}) async {
    try {
      final model =
          SendNumberRequestModel.entityToMode(entity: sendNumberEntity);
      final response = await _datasourceNtw.sendNumber(model: model);
      return SendNumberSuccess(
        status: response.status!,
        message: response.message!,
      );
    } catch (e) {
      if (e is DioException) {
        return SendNumberFailure(
          sendNumberFailureStatus: ErrorSendNumberHundler.handleDioError(e),
        );
      } else {
        return SendNumberFailure(
            sendNumberFailureStatus: SendNumberFailureStatus.unknown);
      }
    }
  }

  @override
  Future<SendCodeResult> sendCode(
      {required SendCodeRequestEntity sendCodeRequestEntity}) async {
    try {
      final model =
          SendCodeRequestModel.entityToMode(entity: sendCodeRequestEntity);
      final response = await _datasourceNtw.sendCode(model: model);
      return SendCodeSucces(
        status: response.status,
        message: response.message,
      );
    } catch (e) {
      if (e is DioException) {
        return SendCodeFailure(
          sendCodeFailureStatus: ErrorSendCodeHundler.handleDioError(e),
        );
      } else {
        return SendCodeFailure(
            sendCodeFailureStatus: SendCodeFailureStatus.unknown);
      }
    }
  }
}
