import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/constant/app_strings.dart';
import 'firebase_failure.dart';

class FirebaseErrorHandler implements Exception {
  late FirebaseFailure failure;

  FirebaseErrorHandler.handle(dynamic error) {
    if (error is FirebaseAuthException) {
      failure = _handleError(error);
    } else if (error == "NoInternet") {
      failure = DataSource.noInternet.getFailure();
    } else if (error is FirebaseFailure) {
      if (error.message == "Invalid credential") {
        failure = DataSource.invalidCredential.getFailure();
      } else if (error.message == "Too many Requests") {
        failure = DataSource.tooManyRequests.getFailure();
      } else if (error.message == "Email is already in use") {
        failure = DataSource.emailAlreadyInUse.getFailure();
      } else if (error.message == "Network request failed") {
        failure = DataSource.networkRequestFailed.getFailure();
      }
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

FirebaseFailure _handleError(FirebaseAuthException error) {
  switch (error.code) {
    case "invalid-credential":
      return DataSource.invalidCredential.getFailure();
    case "too-many-requests":
      return DataSource.tooManyRequests.getFailure();
    case "email-already-in-use":
      return DataSource.emailAlreadyInUse.getFailure();
    case "network-request-failed":
      return DataSource.networkRequestFailed.getFailure();
  }
  throw (error);
}

enum DataSource {
  tooManyRequests,
  invalidCredential,
  emailAlreadyInUse,
  networkRequestFailed,
  defaultError,
  noInternet
}

extension DataSourceExtension on DataSource {
  FirebaseFailure getFailure() {
    switch (this) {
      case DataSource.tooManyRequests:
        return FirebaseFailure(ResponseMessage.tooManyRequests);
      case DataSource.networkRequestFailed:
        return FirebaseFailure(ResponseMessage.networkRequestFailed);
      case DataSource.invalidCredential:
        return FirebaseFailure(ResponseMessage.invalidCredential);
      case DataSource.emailAlreadyInUse:
        return FirebaseFailure(ResponseMessage.emailAlreadyInUse);
      case DataSource.noInternet:
        return FirebaseFailure(ResponseMessage.noInternet);
      case DataSource.defaultError:
        return FirebaseFailure(ResponseMessage.defaultError);
    }
  }
}

class ResponseMessage {
  static const String tooManyRequests = AppStrings.tooManyRequests;
  static const String networkRequestFailed = AppStrings.networkRequestFailed;
  static const String invalidCredential = AppStrings.invalidCredential;
  static const String emailAlreadyInUse = AppStrings.emailAlreadyInUse;
  static const String noInternet = AppStrings.noInternetError;
  static const String defaultError = AppStrings.defaultError;
}
