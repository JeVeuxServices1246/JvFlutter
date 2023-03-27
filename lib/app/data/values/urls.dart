class URLs {
  /// BaseURL

  static const baseURL = "https://api.jvservices.ca";

  static const loginapi = "$baseURL/loginapi";

  ///Auth APIs
  static const sentOtp = "$loginapi/send_otp/";
  static const login = "$loginapi/login/";
  static const registration = "$loginapi/register/";

  /// upload file
  static const apiUploadImage = "$baseURL/api/upload_image/";
}
