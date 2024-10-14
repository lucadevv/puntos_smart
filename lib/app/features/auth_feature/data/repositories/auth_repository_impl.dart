import 'package:dio/dio.dart';
import 'package:puntos_smart_user/app/api/failure/error_handler.dart';
import 'package:puntos_smart_user/app/api/failure/error_send_code_hundler.dart';
import 'package:puntos_smart_user/app/api/failure/error_send_number_hundler.dart';
import 'package:puntos_smart_user/app/api/failure/forgot_number_password.dart';
import 'package:puntos_smart_user/app/api/failure/update_password_hundler.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/datasource/auth_datasource_ntw.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/send_code_request_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/send_number_request_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/sig_up_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/sing_in_mode.dart';
import 'package:puntos_smart_user/app/features/auth_feature/data/models/request/update_password_model.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/send_codeotp_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/update_password_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/forgot_verify_number_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/signin_response_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/sing_up_response_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/update_password_response_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/verify_codeotp_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/response/verify_number_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/send_number_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/sign_in_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/entities/request/sign_up_entity.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/repositories/auth_repository.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/forgot_verify_number_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/update_password_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/verify_codeotp_result.dart';
import 'package:puntos_smart_user/app/features/auth_feature/domain/result/verify_number_result.dart';
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
      final signInResponseEntity =
          SignInResponseEntity.modelToEntity(model: response);
      return SignInSuccess(signInResponseEntity: signInResponseEntity);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 400) {
          return SignInFailure(
            signInFailureStatus: SignInFailureStatus.unAuthorized,
          );
        } else if (e.response?.statusCode == 401) {
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
            signInFailureStatus: SignInFailureStatus.unknown,
          );
        }
      } else {
        return SignInFailure(signInFailureStatus: SignInFailureStatus.unknown);
      }
    }
  }

  @override
  Future<SignUpResult> signUp({required SignUpEntity signUpEntity}) async {
    try {
      final model = SignUpModel.entityToModel(entity: signUpEntity);
      final response = await _datasourceNtw.sigUp(model: model);

      return SignUpSuccess(
          signUpResponseEntity:
              SignUpResponseEntity.modelToEntity(model: response));
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
  Future<VerifyNumberResult> verifyNumber(
      {required SendNumberEntity sendNumberEntity}) async {
    try {
      final model =
          SendNumberRequestModel.entityToModel(entity: sendNumberEntity);
      final response = await _datasourceNtw.verifyNumber(model: model);
      final verifyNumberEntity =
          VerifyNumberEntity.modelToEntity(model: response);
      return VerifyNumberSuccess(
        verifyNumberEntity: verifyNumberEntity,
      );
    } catch (e) {
      if (e is DioException) {
        return VerifyNumberFailure(
          sendNumberFailureStatus: ErrorSendNumberHundler.handleDioError(e),
        );
      } else {
        return VerifyNumberFailure(
            sendNumberFailureStatus: SendNumberFailureStatus.unknown);
      }
    }
  }

  @override
  Future<VerifyCodeOtpResult> verifyCode({
    required SendCodeOtpEntity sendCodeOtpEntity,
    required String otpScreen,
  }) async {
    try {
      final model =
          SendCodeRequestModel.entityToMode(entity: sendCodeOtpEntity);
      final response =
          await _datasourceNtw.verifyCode(model: model, otpScreen: otpScreen);

      return VerifyCodeOtpSucces(
        verifyCodeOtpEntity: VerifyCodeOtpEntity.modelToEntity(model: response),
      );
    } catch (e) {
      if (e is DioException) {
        return VerifyCodeOtpFailure(
          verifyCodeOtpFailureStatus: ErrorSendCodeHundler.handleDioError(e),
        );
      } else {
        return VerifyCodeOtpFailure(
          verifyCodeOtpFailureStatus: VerifyCodeOtpFailureStatus.unknown,
        );
      }
    }
  }

  @override
  Future<ForgotVerifyNumberResult> verifyNumberForgot(
      {required SendNumberEntity sendNumberEntity}) async {
    try {
      final model =
          SendNumberRequestModel.entityToModel(entity: sendNumberEntity);
      final response = await _datasourceNtw.forgotVerifyNumber(model: model);
      return ForgotVerifyNumberSuccess(
          forgotVerifyNumberEntity:
              ForgotVerifyNumberEntity.modelToEntity(model: response));
    } catch (e) {
      if (e is DioException) {
        return ForgotVerifyNumberFailure(
          forgotVerifyNumberFailureStatus:
              ErrorForgotNumberHundler.handleDioError(e),
        );
      } else {
        return ForgotVerifyNumberFailure(
            forgotVerifyNumberFailureStatus:
                ForgotVerifyNumberFailureStatus.unknown);
      }
    }
  }

  @override
  Future<UpdatePasswordResult> updatePassword(
      {required UpdatePasswordEntity updatePasswordEntity}) async {
    try {
      final model =
          UpdatePasswordModel.entityToModel(entity: updatePasswordEntity);
      final response = await _datasourceNtw.updatePassword(model: model);

      return UpdatePasswordSuccess(
        updatePasswordResponseEntity:
            UpdatePasswordResponseEntity.modelToEntity(model: response),
      );
    } catch (e) {
      if (e is DioException) {
        return UpdatePasswordFailure(
            updatePasswordFailureStatus:
                ErrorUpdatePasswordHundler.handleDioError(e));
      } else {
        return UpdatePasswordFailure(
            updatePasswordFailureStatus: UpdatePasswordFailureStatus.unknown);
      }
    }
  }
}
