class EndPoints {
  const EndPoints._();

  static const login = '/api/v1/customers/login';
  static const register = '/api/v1/customers/updateAfterNumberValidation';
  static const verifyNumber = '/api/v1/customers/verifyPhoneNumber';
  static const sendCodeVerify = '/api/v1/customers/verifyOtpCode';
}
