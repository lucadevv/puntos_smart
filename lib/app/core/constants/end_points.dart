class EndPoints {
  const EndPoints._();

  static const login = '/api/v1/customers/login';
  static const register = '/api/v1/customers/updateAfterNumberValidation';
  static const verifyNumber = '/api/v1/customers/verifyPhoneNumber';
  static const forgotVerifyNumber = '/api/v1/customers/forgotPhoneNumberPass';
  static const sendCodeVerify = '/api/v1/customers/verifyOtpCode';
  static const forgotSendCodeVerify =
      '/api/v1/customers/verifyOptRecoveryPassword';
  static const updatePassword = "/api/v1/customers/updatePasswordByUuid";
}
