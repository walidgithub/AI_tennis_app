import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/constant/app_strings.dart';
import 'firebase_failure.dart';

class FirebaseErrorHandler implements Exception {
  late FirebaseFailure failure;

  FirebaseErrorHandler.handle(dynamic error) {
    if (error is FirebaseAuthException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.Default.getFailure();
    }
  }
}

FirebaseFailure _handleError(FirebaseAuthException error) {
  switch (error.code) {
    case "invalid-credential":
      return DataSource.InvalidCredential.getFailure();
    case "too-many-requests":
      return DataSource.TooManyRequests.getFailure();
    case "email-already-in-use":
      return DataSource.EmailAlreadyInUse.getFailure();
  }
  throw (error);
}

enum DataSource { TooManyRequests, InvalidCredential, EmailAlreadyInUse, Default }

extension DataSourceExtension on DataSource {
  FirebaseFailure getFailure() {
    switch (this) {
      case DataSource.TooManyRequests:
        return FirebaseFailure(ResponseMessage.tooManyRequests);
      case DataSource.InvalidCredential:
        return FirebaseFailure(ResponseMessage.invalidCredential);
      case DataSource.EmailAlreadyInUse:
        return FirebaseFailure(ResponseMessage.emailAlreadyInUse);
      case DataSource.Default:
        return FirebaseFailure(ResponseMessage.Default);
    }
  }
}

class ResponseMessage {
  static const String tooManyRequests = AppStrings.tooManyRequests;
  static const String invalidCredential = AppStrings.invalidCredential;
  static const String emailAlreadyInUse = AppStrings.emailAlreadyInUse;
  static const String Default = AppStrings.defaultError;
}
