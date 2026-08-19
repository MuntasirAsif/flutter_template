class Endpoints {
  static const base = 'https://api-ccwconnect.kodevio.com/api/v1/';

  /// Authentication
  static const String register = '/auth/register/';
  static const String login = '/auth/login';
  static const String forgotPassword = '/auth/forgot-password/';
  static const String resetPassword = '/auth/reset_password/';
  static const String refreshToken = '/auth/refresh_token/';

  /// OTP
  static const String verifyOtp = '/auth/verify-otp/';
  static const String resendOtp = '/otp/resend_otp/';
}
