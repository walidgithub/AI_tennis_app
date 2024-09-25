import 'package:dartz/dartz.dart';
import '../../../../core/firebase/error/firebase_failure.dart';
import '../entities/credential_model.dart';
import '../entities/user_model.dart';

abstract class FirebaseRepository {
  Future<Either<FirebaseFailure, void>> login(
      CredentialModel credentialModel);

  Future<Either<FirebaseFailure, void>> register(
      CredentialModel credentialModel);

  Future<Either<FirebaseFailure, void>> logout();
}