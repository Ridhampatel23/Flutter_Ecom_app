/// Exception class for handling various errors.
class ecomExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const ecomExceptions([this.message = 'An unexpected error occurred. Please try again.']);

  /// Create an authentication exception from a Firebase authentication exception code.
  factory ecomExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const ecomExceptions('The email address is already registered. Please use a different email.');
      case 'invalid-email':
        return const ecomExceptions('The email address provided is invalid. Please enter a valid email.');
      case 'weak-password':
        return const ecomExceptions('The password is too weak. Please choose a stronger password.');
      case 'user-disabled':
        return const ecomExceptions('This user account has been disabled. Please contact support for assistance.');
      case 'user-not-found':
        return const ecomExceptions('Invalid login details. User not found.');
      case 'wrong-password':
        return const ecomExceptions('Incorrect password. Please check your password and try again.');
      case 'INVALID_LOGIN_CREDENTIALS':
        return const ecomExceptions('Invalid login credentials. Please double-check your information.');
      case 'too-many-requests':
        return const ecomExceptions('Too many requests. Please try again later.');
      case 'invalid-argument':
        return const ecomExceptions('Invalid argument provided to the authentication method.');
      case 'invalid-password':
        return const ecomExceptions('Incorrect password. Please try again.');
      case 'invalid-phone-number':
        return const ecomExceptions('The provided phone number is invalid.');
      case 'operation-not-allowed':
        return const ecomExceptions('The sign-in provider is disabled for your Firebase project.');
      case 'session-cookie-expired':
        return const ecomExceptions('The Firebase session cookie has expired. Please sign in again.');
      case 'uid-already-exists':
        return const ecomExceptions('The provided user ID is already in use by another user.');
      case 'sign_in_failed':
        return const ecomExceptions('Sign-in failed. Please try again.');
      case 'network-request-failed':
        return const ecomExceptions('Network request failed. Please check your internet connection.');
      case 'internal-error':
        return const ecomExceptions('Internal error. Please try again later.');
      case 'invalid-verification-code':
        return const ecomExceptions('Invalid verification code. Please enter a valid code.');
      case 'invalid-verification-id':
        return const ecomExceptions('Invalid verification ID. Please request a new verification code.');
      case 'quota-exceeded':
        return const ecomExceptions('Quota exceeded. Please try again later.');
      default:
        return const ecomExceptions();
    }
  }
}
