class EndPoints {
  const EndPoints._();

  static const login = '/auth/customer/';
  static const register = '/api/v1/customers/updateAfterNumberValidation';
  static const verifyNumber = '/api/v1/customers/verifyPhoneNumber';
  static const sendCodeVerify = '/api/v1/customers/verifyOtpCode';
}
