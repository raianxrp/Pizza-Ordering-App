class MyPlatformExceptions implements Exception {
  final String code;

  MyPlatformExceptions(this.code);

  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your credentials information.';
      case 'too-many-arguments':
        return 'Too many requests. Please try again later.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method';
      case 'invalid-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-phone-number':
        return 'The provided number is invalid.';
      case 'operation-not-allowed':
        return 'The sign-in provider is disabled for your Firebase project';
      case 'session-cookie-expired':
        return 'The Firebase Sign In cookie has expired. Please Sign In again.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'sign_in_failed':
        return 'Sign In failed. Please try again.';
      case 'network-request-failed':
        return 'Network request failed. Please check your internet connection.';
      case 'internal-error':
        return 'Internal error. Please try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please enter a valid code.';
      default:
        return 'An error occured. Please try again';
    }
  }
}
