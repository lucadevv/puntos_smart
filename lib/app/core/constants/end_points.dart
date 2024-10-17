class EndPoints {
  const EndPoints._();

  /*
  ------------------------AUTH---------------------
   */

  static const login = '/api/v1/customers/login';
  static const register = '/api/v1/customers/updateAfterNumberValidation';
  static const verifyNumber = '/api/v1/customers/verifyPhoneNumber';
  static const forgotVerifyNumber = '/api/v1/customers/forgotPhoneNumberPass';
  static const sendCodeVerify = '/api/v1/customers/verifyOtpCode';
  static const forgotSendCodeVerify =
      '/api/v1/customers/verifyOptRecoveryPassword';
  static const updatePassword = "/api/v1/customers/updatePasswordByUuid";

  /*
  ------------------------HOME PAGE---------------------
   */

  static const bannersNoLogin = '/api/v1/customers/getBanner';
  static const modulesNoLogin = '/api/v1/customers/getCategory';
  static const newsHome = '/api/v1/customers/getNoticias';
  static const featuredHome = "/api/v1/customers/getProductosDestacados";
/*
  ------------------------MODULE PAGE---------------------
   */
  static const geoPromotions = "/api/v1/customers/findPromotionalProductNear";
}
