class Applink {



  static const String server = "http://192.168.247.164:8000/api";

//static const String test = "$server/test.php ";
////////////////////////////////////////////aouth//////////////////////////

  static const String sinup = "$server/auth/register_app";

  static const String login = "$server/auth/login_app";

  static const String verfaicodesinup = "$server/auth/verify/otp/store";
  static const String resendCode = "$server/auth/resend-otp";

///////////////////////////////////forget password/////////////////
  static const String chiek_email = "$server/auth/forget-password";
  static const String verfaicode = "$server/auth/verify/otp/reset";
  static const String rest_pasword = "$server/auth/set-new-Password";

/////////////////////////////////////////////////
}
