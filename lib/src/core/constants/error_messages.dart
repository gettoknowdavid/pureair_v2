class ErMsg {
  const ErMsg._();

  static const String unknown = 'Unknown Error';
  static const String permissionDenied = 'You do not have the permission to '
      'run this operation. Please contact support.';
  static const String cancelled = 'The action was cancelled';
  static const String invalidEmailOrPassword =
      '''Invalid email address and password combination''';
  static const String emailAlreadyInUse =
      '''This email is already linked to account. Please, sign in instead.''';
  static const String emptyFullName = 'Full name cannot be empty';
  static const String emptyEmail = 'Email address cannot be empty';
  static const String emptyPassword = 'Password cannot be empty';
  static const String invalidEmail = 'Invalid email address';
  static const String invalidPassword =
      '''Invalid password. Password must be at least 8 characters.''';
}
